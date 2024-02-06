import 'package:tr_app/domain/entities/product.dart';

class ProductModel {
  final String plu;
  final String productName;
  final String imageUrl;
  final String supplierCode;
  final String supplierName;

  ProductModel({
    required this.plu,
    required this.productName,
    required this.imageUrl,
    required this.supplierCode,
    required this.supplierName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      plu: json['plu'],
      productName: json['productName'],
      imageUrl: json['imageUrl'],
      supplierCode: json['supplierCode'],
      supplierName: json['supplierName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plu': plu,
      'productName': productName,
      'imageUrl': imageUrl,
      'supplierCode': supplierCode,
      'supplierName': supplierName,
    };
  }

  Product toProduct() {
    return Product(
      plu: plu,
      productName: productName,
      imageUrl: imageUrl,
      supplierCode: supplierCode,
      supplierName: supplierName,
    );
  }
}
