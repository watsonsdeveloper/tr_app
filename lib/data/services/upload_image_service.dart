import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/domain/services/upload_image_service.dart';
import 'package:tr_app/utils/dio_extension.dart';

class UploadImageServiceImpl extends UploadImageService {
  late Dio _dio;

  UploadImageServiceImpl() {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  @override
  Future<UploadedImage> add(UploadedImage t) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<UploadedImage> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<UploadedImage>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<UploadedImage> modify(UploadedImage t) {
    // TODO: implement modify
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(int id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<List<UploadedImage>> getUploadedImages(
      String storeId, int trCartId) async {
    try {
      Map<String, dynamic> parameters = {
        "storeId": storeId,
        "trCartId": trCartId
      };
      final jsonBody = jsonEncode(parameters);
      Response<dynamic> response = await _dio
          .post('/mobileApi/uploadImage/getUploadedImageUrls', data: jsonBody);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return (response.data["data"] as List)
              .map((e) => UploadedImage.fromJson(e))
              .toList();
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UploadedImage> uploadImage(
      String storeId, int trCartId, String base64Image) async {
    try {
      Map<String, dynamic> parameters = {
        "storeId": storeId,
        "trCartId": trCartId,
        "base64Image": base64Image
      };
      final jsonBody = jsonEncode(parameters);
      Response<dynamic> response =
          await _dio.post('/mobileApi/uploadImage', data: jsonBody);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return UploadedImage.fromJson(response.data["data"]);
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<bool> removeUploadedImage(
      String storeId, int trCartId, int uploadedImageId) async {
    try {
      Map<String, dynamic> parameters = {
        "storeId": storeId,
        "trCartId": trCartId,
        "imageIds": [uploadedImageId]
      };
      final jsonBody = jsonEncode(parameters);
      Response<dynamic> response = await _dio
          .delete('/mobileApi/uploadImage/deleteUploadedImages', data: jsonBody);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return response.data["data"];
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
