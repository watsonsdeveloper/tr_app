import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tr_app/config.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/services/cart_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/dio_extension.dart';
import 'package:tr_app/utils/error_handler.dart';
import 'package:tr_app/utils/http_client.dart';
import 'package:http/http.dart' as http;

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

      // final response =
      //     await Http.post("/mobileApi/trCart/addToTrCart", request);

      final response = await http.post(
        Uri.parse('${Config.trv2BaseUrl}/mobileApi/trCart/addToTrCart'),
        body: jsonEncode(request),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == HttpStatus.ok) {
        // final responseBody = await readResponse(response);
        // final json = jsonDecode(responseBody);
        final json = jsonDecode(response.body);

        if (json["isSuccess"]) {
          return Cart.fromJson(json["data"]);
        } else {
          throw Exception(json["errorMessage"]);
        }
      }
      return throw Exception(response);
    } catch (e) {
      rethrow;
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
    debugPrint('getCarts - $storeId - ${brand.index}');
    try {
      Map<String, String> queryParameters = {
        "storeId": storeId,
        "brand": brand.index.toString()
      };

      // final response =
      //     await Http.get("/mobileApi/trCart/getTrCartList", queryParameters);

      final response = await http.get(
        Uri.parse(
            '${Config.trv2BaseUrl}/mobileApi/trCart/getTrCartList?${Uri(queryParameters: queryParameters).query}'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == HttpStatus.ok) {
        // final responseBody = await readResponse(response);
        // final json = jsonDecode(responseBody);
        final json = jsonDecode(response.body);

        if (json["isSuccess"]) {
          final cartList =
              json["data"].map<Cart>((item) => Cart.fromJson(item)).toList();
          return cartList;
        } else {
          throw ErrorHandler.handleErrorMessage(json["errorMessage"]);
        }
      }
      throw ErrorHandler.handleErrorMessage(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Cart> getCart(String storeId, int trCartId) async {
    try {
      Map<String, String> queryParameters = {
        "storeId": storeId,
        "trCartId": trCartId.toString()
      };

      // Response<dynamic> response = await _dio.get('/mobileApi/trCart/getTrCart',
      //     queryParameters: queryParameters);
      // final response =
      //     await Http.get("/mobileApi/trCart/getTrCart", queryParameters);

      // if (response.statusCode == HttpStatus.ok) {
      //   final responseBody = await readResponse(response);
      //   final json = jsonDecode(responseBody);

      //   if (json.data["isSuccess"]) {
      //     Cart cart = Cart.fromJson(json.data["data"]);
      //     return cart;
      //   } else {
      //     throw Exception(json.data["errorMessage"]);
      //   }
      // }
      // return throw Exception(response);
      throw UnimplementedError();
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
          throw ErrorHandler.handleErrorMessage(response.data["errorMessage"]);
        }
      }
      return throw ErrorHandler.handleErrorMessage(response.data);
    } catch (e) {
      return throw ErrorHandler.handleErrorMessage(e.toString());
    }
  }

  @override
  Future<Cart> updateCartRequirement(String storeId, int trCartId,
      String username, Reason reason, String? justification) async {
    try {
      Map<String, dynamic> parameters = {
        "storeId": storeId,
        "trCartId": trCartId,
        "reason": reason.index,
        "justification": justification,
        "updatedBy": username
      };
      final jsonBody = jsonEncode(parameters);
      Response<dynamic> response = await _dio
          .post('/mobileApi/trCart/updateTrCartRequirement', data: jsonBody);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return Cart.fromJson(response.data["data"]);
        } else {
          throw ErrorHandler.handleErrorMessage(response.data["errorMessage"]);
        }
      }
      return throw ErrorHandler.handleErrorMessage(response.data);
    } catch (e) {
      throw ErrorHandler.handleErrorMessage(e.toString());
    }
  }
}
