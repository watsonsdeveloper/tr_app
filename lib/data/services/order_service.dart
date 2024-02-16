import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/domain/services/order_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/dio_extension.dart';

class OrderServiceImpl implements OrderService {
  late Dio _dio;

  OrderServiceImpl() {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  @override
  Future<List<Cart>> addCartToOrder(
      List<Cart> carts, String storeId, Brand brand, String createdBy) async {
    try {
      Map<String, dynamic> request = {
        "trCartDtoList": carts,
        "storeId": storeId,
        "brand": brand.index,
        "createdBy": createdBy
      };
      final jsonData = jsonEncode(request);
      debugPrint(jsonData);
      Response<dynamic> response =
          await _dio.post('/mobileApi/trOrder/addToTrOrder', data: jsonData);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          return (response.data["data"] as List)
              .map((e) => Cart.fromJson(e))
              .toList();
          // return Cart.fromJson(response.data["data"]);
        } else if (response.data["data"] != null) {
          return (response.data["data"] as List)
              .map((e) => Cart.fromJson(e))
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
  Future<Order> getOrder(String trOrderId, String storeId) async {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderBatch>> getOrderBatchList(String storeId, Brand brand,
      TrOrderStatus status, String? pluOrBarcode) async {
    try {
      Map<String, dynamic> request = {
        "storeId": storeId,
        "brand": brand.index,
        "status": status.index
      };
      if (pluOrBarcode != null) {
        request["pluOrBarcode"] = pluOrBarcode;
      }
      final jsonData = jsonEncode(request);
      debugPrint(jsonData);
      Response<dynamic> response = await _dio
          .post('/mobileApi/trOrder/getTrOrderBatchList', data: jsonData);
      if (response.statusCode == 200) {
        debugPrint('getOrderBatchList @ ${response.data.toString()}');
        if (response.data["isSuccess"]) {
          return (response.data["data"] as List)
              .map((e) => OrderBatch.fromJson(e))
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
  Future<List<Order>> getOrderList(int trOrderBatchId, String storeId,
      Brand brand, TrOrderStatus status, String? pluOrBarcode) async {
    try {
      Map<String, dynamic> request = {
        "trOrderBatchId": trOrderBatchId,
        "storeId": storeId,
        "pluOrBarcode": pluOrBarcode,
        "status": status.index
      };
      final jsonData = jsonEncode(request);
      debugPrint(jsonData);
      Response<dynamic> response =
          await _dio.post('/mobileApi/trOrder/getTrOrderList', data: jsonData);
      if (response.statusCode == 200) {
        if (response.data["isSuccess"]) {
          debugPrint(response.data["data"].toString());
          return (response.data["data"] as List)
              .map((e) => Order.fromJson(e))
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
}
