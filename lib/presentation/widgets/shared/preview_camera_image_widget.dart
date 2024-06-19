import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/presentation/view_models/upload_image_view_model.dart';
import 'package:tr_app/utils/error_handler.dart';
import 'package:image/image.dart' as img;

class PreviewCameraImageWidget extends HookConsumerWidget {
  final int cartId;
  final Function setUploading;

  const PreviewCameraImageWidget(
      {super.key, required this.cartId, required this.setUploading});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadedImages = useState<List<UploadedImage>>([]);
    final isLoading = useState<bool>(false);

    useEffect(() {
      Future.delayed(const Duration(seconds: 0), () async {
        uploadedImages.value = await ref
            .read(uploadImageNotifierProvider.notifier)
            .getUploadedImages(cartId);
      });
      return null;
    }, [cartId]);

    Future takePhoto() async {
      try {
        final pickedFile = await ImagePicker().pickImage(
            source: ImageSource.camera,
            maxHeight: 640,
            maxWidth: 480,
            imageQuality: 80);

        if (pickedFile != null) {
          if (isLoading.value) return;
          isLoading.value = true;
          setUploading(true);

          // await FlutterExifRotation.rotateAndSaveImage(path: pickedFile.path);
          List<int> fileBytes = await File(pickedFile.path).readAsBytes();
          final img.Image? capturedImage = img.decodeImage(fileBytes);
          final img.Image orientedImage = img.bakeOrientation(capturedImage!);
          await File(pickedFile.path)
              .writeAsBytes(img.encodeJpg(orientedImage));

          final file = File(pickedFile.path);
          fileBytes = file.readAsBytesSync();
          String base64Image = base64Encode(fileBytes);

          final uploadedImage = await ref
              .read(uploadImageNotifierProvider.notifier)
              .uploadImage(cartId, base64Image);

          if (uploadedImage != null) {
            uploadedImages.value = [...uploadedImages.value]
              ..add(uploadedImage);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Failed to upload image',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
          }

          if (context.mounted) {
            isLoading.value = false;
            setUploading(false);
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ErrorHandler.handleErrorMessage(e.toString())),
            ),
          );
          isLoading.value = false;
          setUploading(false);
        }
      }
    }

    Future removePhoto(UploadedImage removeImage) async {
      try {
        final isRemoved = await ref
            .read(uploadImageNotifierProvider.notifier)
            .removeUploadedImage(cartId, removeImage.trImageId!);
        if (isRemoved) {
          if (context.mounted) {
            uploadedImages.value = [...uploadedImages.value]
              ..remove(removeImage);
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(ErrorHandler.handleErrorMessage(e.toString())),
            ),
          );
        }
      }
    }

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...uploadedImages.value.map(
              (image) {
                return Container(
                  constraints:
                      const BoxConstraints(minWidth: 70, minHeight: 120),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: image.imageUrl != null
                              ? SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.network(
                                    image.imageUrl!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Text(exception.toString());
                                    },
                                  ),
                                )
                              : const Icon(Icons.image_not_supported_rounded)),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.red,
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            constraints: const BoxConstraints(
                              minHeight: 0,
                              minWidth: 0,
                            ),
                            iconSize: 28,
                            onPressed: () => removePhoto(image),
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            uploadedImages.value.length >= 3
                ? const SizedBox.shrink()
                : isLoading.value
                    ? Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : IconButton(
                        onPressed: takePhoto,
                        icon: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                        splashColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                      )
          ],
        ),
      ),
    );
  }
}
