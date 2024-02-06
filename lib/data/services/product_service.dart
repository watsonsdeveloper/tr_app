import 'package:dio/dio.dart';
import 'package:tr_app/config.dart';
import 'package:tr_app/data/models/product_image_model.dart';
import 'package:tr_app/data/models/product_model.dart';
import 'package:tr_app/domain/entities/product.dart';
import 'package:tr_app/domain/services/product_service.dart';
import 'package:tr_app/utils/dio_extension.dart';

class ProductServiceImpl implements ProductService {
  late Dio _dio;

  ProductServiceImpl() {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  @override
  Future<bool> remove(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Product> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<Product> getFilter(String pluOrBarcode) async {
    try {
      Response<dynamic> response =
          await _dio.get('/mobileApi/searchProduct/$pluOrBarcode');

      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          Product product =
              ProductModel.fromJson(response.data["data"]).toProduct();
          return product;
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      return throw Exception(e.toString());
    }
  }

  @override
  Future<Product> add(Product t) {
    throw UnimplementedError();
  }

  @override
  Future<Product> modify(Product t) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getRetekImageUrl(String pluOrBarcode) async {
    try {
      Dio dio = Dio();
      DioExtension.config(dio, Config.retekBaseUrl);

      Response<dynamic> response =
          await dio.get('/GetItemImagesPath/$pluOrBarcode');

      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          for (var imageJson in response.data["data"]) {
            var image = ProductImage.fromJson(imageJson);
            if (image.imageType == "front") {
              return image.imagePath;
            }
          }
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
