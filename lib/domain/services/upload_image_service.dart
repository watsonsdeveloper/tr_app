import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/domain/services/service.dart';

abstract class UploadImageService implements Service<UploadedImage> {
  Future<List<UploadedImage>> getUploadedImages(String storeId, int trCartId);
  Future<UploadedImage> uploadImage(String storeId, int trCartId, String base64Image);
  Future<bool> removeUploadedImage(
      String storeId, int trCartId, int uploadedImageId);
}
