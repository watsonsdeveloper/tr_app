import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final uploadedImagesProvider = StateProvider<List<File>>((ref) => []);

class PreviewCameraImageWidget extends HookConsumerWidget {
  const PreviewCameraImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesState = ref.watch(uploadedImagesProvider);

    Future takePhoto() async {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        final currentList = ref.read(uploadedImagesProvider.notifier).state;
        final updatedList = List<File>.from(currentList)
          ..add(File(pickedFile.path));
        ref.read(uploadedImagesProvider.notifier).state = updatedList;
      }
    }

    Future removePhoto(File image) async {
      final currentList = ref.read(uploadedImagesProvider.notifier).state;
      final updatedList = List<File>.from(currentList)..remove(image);
      ref.read(uploadedImagesProvider.notifier).state = updatedList;
    }

    return SizedBox(
      width: double.infinity,
      height: 150,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        restorationId: imagesState.length.toString(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...imagesState.map(
              (image) {
                return Container(
                  constraints:
                      const BoxConstraints(minWidth: 80, minHeight: 150),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.file(
                          image,
                          fit: BoxFit.contain,
                        ),
                      ),
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
            IconButton(
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
              splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
