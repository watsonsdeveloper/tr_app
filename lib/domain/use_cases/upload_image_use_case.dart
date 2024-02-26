import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/domain/services/upload_image_service.dart';

class UploadImageUseCase {
  final UploadImageService _uploadImageService;

  UploadImageUseCase(this._uploadImageService);

  Future<List<UploadedImage>> getUploadedImages(
      String storeId, int trCartId) async {
    try {
      return await _uploadImageService.getUploadedImages(storeId, trCartId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UploadedImage> uploadImage(
      String storeId, int trCartId, String base64Image) async {
    try {
      return await _uploadImageService.uploadImage(
          storeId, trCartId, base64Image);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> removeUploadedImage(
      String storeId, int trCartId, int uploadedImageId) async {
    try {
      return await _uploadImageService.removeUploadedImage(
          storeId, trCartId, uploadedImageId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
