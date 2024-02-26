import 'package:tr_app/utils/constants/enum_constants.dart';

class Order {
  final int trOrderId;
  final String plu;
  final String barcode;
  final String productName;
  final String brandName;
  final String? productImageUrl;
  final Reason? reason;
  final String? justification;
  final String supplierName;
  final String supplierCode;
  final TrOrderStatus trOrderStatus;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? updatedBy;

  Order({
    required this.trOrderId,
    required this.plu,
    required this.barcode,
    required this.productName,
    required this.brandName,
    required this.supplierName,
    required this.supplierCode,
    required this.trOrderStatus,
    this.createdAt,
    this.reason,
    this.justification,
    this.productImageUrl,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      trOrderId: json['trOrderId'],
      plu: json['plu'],
      barcode: json['barcode'],
      productName: json['productName'],
      brandName: json['brandName'],
      productImageUrl: json['productImageUrl'],
      reason: json['reason'] != null ? Reason.values[json['reason']] : null,
      justification: json['justification'],
      supplierName: json['supplierName'],
      supplierCode: json['supplierCode'],
      trOrderStatus: TrOrderStatus.values[json['trOrderStatus']],
      createdBy: json['createdBy'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      updatedBy: json['updatedBy'],
    );
  }
}
