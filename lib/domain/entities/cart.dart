import 'package:tr_app/utils/constants/enum_constants.dart';

class Cart {
  final int? trCartId;
  final String? plu;
  final String? barcode;
  final String? productName;
  final String? brandName;
  final String? imageUrl;
  final int? storeId;
  final Brand? brand;
  final String? reason;
  final String? justification;
  final bool? requireJustify;
  final bool? isAvailableStock;
  final String? supplierName;
  final String? supplierCode;
  final String? createdBy;
  final DateTime? createdAt;
  final String? errorMessage;

  Cart(
      {this.trCartId,
      this.plu,
      this.barcode,
      this.productName,
      this.brandName,
      this.imageUrl,
      this.storeId,
      this.brand,
      this.reason,
      this.justification,
      this.requireJustify,
      this.isAvailableStock,
      this.supplierName,
      this.supplierCode,
      this.createdBy,
      this.createdAt,
      this.errorMessage});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        trCartId: json['trCartId'],
        plu: json['plu'],
        barcode: json['barcode'],
        productName: json['productName'],
        brandName: json['brandName'],
        imageUrl: json['imageUrl'],
        storeId: json['storeId'],
        brand: Brand.values[json['brand']],
        reason: json['reason'],
        justification: json['justification'],
        requireJustify: json['requireJustify'],
        isAvailableStock: json['isAvailableStock'],
        supplierName: json['supplierName'],
        supplierCode: json['supplierCode'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        errorMessage: json['errorMessage']);
  }

  Map<String, dynamic> toJson() {
    return {
      'trCartId': trCartId,
      'reason': reason,
      'justification': justification,
    };
  }
}
