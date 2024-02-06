import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/services/cart_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/dio_extension.dart';

class CartServiceImpl implements CartService {
  late Dio _dio;

  CartServiceImpl() {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  @override
  Future<Cart> add(Cart cart) async {
    throw UnimplementedError();
  }

  @override
  Future<Cart> addToCart(String pluOrBarcode, String storeId, Brand brand,
      String createdBy) async {
    try {
      Map<String, dynamic> request = {
        "pluOrBarcode": pluOrBarcode,
        "storeId": storeId,
        "brand": brand.index,
        "createdBy": createdBy
      };
      Response<dynamic> response = await _dio
          .post('/mobileApi/trCart/addToTrCart', data: jsonEncode(request));
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return Cart.fromJson(response.data["data"]);
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
  Future<Cart> get(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Cart>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<List<Cart>> getCarts(String storeId, Brand brand) async {
    try {
      Map<String, dynamic> queryParameters = {
        "storeId": storeId,
        "brand": brand.index
      };

      Response<dynamic> response = await _dio.get(
        '/mobileApi/trCart/getTrCartList',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          List<Cart> cartList = [];
          for (var item in response.data["data"]) {
            cartList.add(Cart.fromJson(item));
          }
          return cartList;
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
  Future<Cart> getCart(String storeId, int trCartId) async {
    try {
      Map<String, dynamic> queryParameters = {
        "storeId": storeId,
        "trCartId": trCartId
      };

      Response<dynamic> response = await _dio.get('/mobileApi/trCart/getTrCart',
          queryParameters: queryParameters);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          Cart cart = Cart.fromJson(response.data["data"]);
          return cart;
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
  Future<Cart> modify(Cart t) {
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeCart(String storeId, int trCartId) async {
    try {
      Map<String, dynamic> parameters = {
        "storeId": storeId,
        "trCartId": trCartId
      };
      final jsonBody = jsonEncode(parameters);
      Response<dynamic> response =
          await _dio.delete('/mobileApi/trCart/removeTrCart', data: jsonBody);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return response.data["isSuccess"];
        } else {
          throw Exception(response.data["errorMessage"]);
        }
      }
      return throw Exception(response.data);
    } catch (e) {
      return throw Exception(e.toString());
    }
  }
}
