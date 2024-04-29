import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/presentation/view_models/upload_image_view_model.dart';

// final uploadedImagesProvider = StateProvider<List<File>>((ref) => []);

// final uploadedImagesProvider = StateNotifierProvider<>((ref) => []);

class PreviewCameraImageWidget extends HookConsumerWidget {
  final int cartId;

  const PreviewCameraImageWidget({super.key, required this.cartId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final imagesState = ref.read(uploadedImagesProvider);
    final uploadedImages = useState<List<UploadedImage>>([]);

    useEffect(() {
      // ref.read(uploadImageNotifierProvider.notifier).getUploadedImages(cartId);
      // final user = ref.read(userNotifierProvider).user;
      // uploadedImages.value = ref
      //     .read(uploadImageUseCaseProvider)
      //     .getUploadedImages(user!.storeId, cartId) as List<UploadedImage>;
      // return null;

      Future.delayed(const Duration(seconds: 0), () async {
        uploadedImages.value = await ref
            .read(uploadImageNotifierProvider.notifier)
            .getUploadedImages(cartId);
      });
      return null;
    }, [cartId]);

    Future takePhoto() async {
      try {
        final pickedFile =
            await ImagePicker().pickImage(source: ImageSource.camera);

        if (pickedFile != null) {
          // final currentList = ref.read(uploadedImagesProvider.notifier).state;
          // final currentList = ref.read(uploadedImagesProvider.notifier).state;
          // final updatedList = List<File>.from(currentList)
          //   ..add(File(pickedFile.path));

          final file = File(pickedFile.path);
          List<int> fileBytes = file.readAsBytesSync();
          String base64Image = base64Encode(fileBytes);

          

          final uploadedImage = await ref
              .read(uploadImageNotifierProvider.notifier)
              .uploadImage(cartId, base64Image);

          if (uploadedImage != null) {
            // uploadedImages.value =
            //     List<UploadedImage>.from(uploadedImages.value)
            //       ..add(uploadedImage);
            uploadedImages.value = [...uploadedImages.value]
              ..add(uploadedImage);
          }

          // uploadedImages.value = [
          //   ...uploadedImages.value,
          //   UploadedImage(
          //     cartId: cartId,
          //     image: base64Image,
          //     imageUrl: file.path,
          //   ),
          // ];

          // ref.read(uploadedImagesProvider.notifier).state = updatedList;
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
          ),
        );
      }
    }

    Future removePhoto(UploadedImage removeImage) async {
      try {
        final isRemoved = await ref
            .read(uploadImageNotifierProvider.notifier)
            .removeUploadedImage(cartId, removeImage.trImageId!);
        if (isRemoved) {
          uploadedImages.value = [...uploadedImages.value]..remove(removeImage);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
          ),
        );
      }
    }

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // restorationId: uploadedImages.toString(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ref.watch(uploadedImagesFutureProvider).when(
            //       data: (data) {
            //         return Text('Cart ID: ${data.trCartId}');
            //       },
            //       loading: () => const CircularProgressIndicator(),
            //       error: (error, stackTrace) => Text(
            //         error.toString().replaceAll('Exception: ', ''),
            //       ),
            //     ),
            ...uploadedImages.value.map(
              (image) {
                return Container(
                  constraints:
                      const BoxConstraints(minWidth: 80, minHeight: 150),
                  child: Stack(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8),
                          // child: Image.file(
                          //   image,
                          //   fit: BoxFit.contain,
                          // ),
                          child: image.imageUrl != null
                              ? SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Image.network(
                                    image.imageUrl!,
                                    fit: BoxFit.cover,
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
                : IconButton(
                    onPressed: takePhoto,
                    icon: Container(
                      width: 120,
                      height: 120,
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
