import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/upload_image_service.dart';
import 'package:tr_app/domain/services/upload_image_service.dart';
import 'package:tr_app/domain/use_cases/upload_image_use_case.dart';

final uploadImageServiceProvider = Provider<UploadImageService>((ref) {
  return UploadImageServiceImpl();
});

final uploadImageUseCaseProvider = Provider<UploadImageUseCase>((ref) {
  return UploadImageUseCase(ref.read(uploadImageServiceProvider));
});