import 'package:tr_app/utils/constants/enum_constants.dart';

class OrderBatch {
  final int trOrderBatchId;
  final TrOrderBatchStatus trOrderBatchStatus;
  final int storeId;
  final Brand brand;
  final DateTime createdAt;
  final String createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;

  OrderBatch({
    required this.trOrderBatchId,
    required this.trOrderBatchStatus,
    required this.storeId,
    required this.brand,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  factory OrderBatch.fromJson(Map<String, dynamic> json) {
    return OrderBatch(
      trOrderBatchId: json['trOrderBatchId'],
      trOrderBatchStatus: TrOrderBatchStatus.values[json['trOrderBatchStatus']],
      storeId: json['storeId'],
      brand: Brand.values[json['brand']],
      createdAt: DateTime.parse(json['createdAt']),
      createdBy: json['createdBy'],
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      updatedBy: json['updatedBy'],
    );
  }
}
