import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class TrModel {
  final int trPluId;
  final String plu;
  final String productName;
  final int storeId;
  final String reason;
  final int status;
  final String createdBy;
  final String? barcode;
  final String? supplierName;
  final String? supplierCode;
  final DateTime? createdAt;

  TrModel({
    required this.trPluId,
    required this.plu,
    required this.productName,
    required this.storeId,
    required this.reason,
    required this.status,
    required this.createdBy,
    this.barcode,
    this.supplierName,
    this.supplierCode,
    this.createdAt,
  });

  factory TrModel.fromJson(Map<String, dynamic> json) {
    return TrModel(
      trPluId: json['trPluId'],
      plu: json['plu'],
      productName: json['productName'],
      storeId: json['storeId'],
      reason: json['reason'],
      status: json['status'],
      createdBy: json['createdBy'],
      barcode: json['barcode'],
      supplierName: json['supplierName'],
      supplierCode: json['supplierCode'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trPluId': trPluId,
      'plu': plu,
      'productName': productName,
      'storeId': storeId,
      'reason': reason,
      'status': status,
      'createdBy': createdBy,
      'barcode': barcode,
      'supplierName': supplierName,
      'supplierCode': supplierCode,
      'createdAt': createdAt,
    };
  }

  Tr toTr() {
    return Tr(
      plu: plu,
      productName: productName,
      productDescription: reason,
      requestDateTime: createdAt.toString(),
      status: TrStatus.values[status],
      supplierCode: supplierCode ?? '',
      supplierName: supplierName ?? '',
    );
  }
}
