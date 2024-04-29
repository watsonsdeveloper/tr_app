// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      trOrderId: json['trOrderId'] as int,
      plu: json['plu'] as String,
      barcode: json['barcode'] as String,
      productName: json['productName'] as String,
      brandName: json['brandName'] as String,
      productImageUrl: json['productImageUrl'] as String?,
      reason: ReasonFreezed.fromJson(json['reason'] as int?),
      justification: json['justification'] as String?,
      supplierName: json['supplierName'] as String,
      supplierCode: json['supplierCode'] as String,
      trOrderStatus:
          TrOrderStatusFreezed.fromJson(json['trOrderStatus'] as int?),
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'trOrderId': instance.trOrderId,
      'plu': instance.plu,
      'barcode': instance.barcode,
      'productName': instance.productName,
      'brandName': instance.brandName,
      'productImageUrl': instance.productImageUrl,
      'reason': ReasonFreezed.toJson(instance.reason),
      'justification': instance.justification,
      'supplierName': instance.supplierName,
      'supplierCode': instance.supplierCode,
      'trOrderStatus': TrOrderStatusFreezed.toJson(instance.trOrderStatus),
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };
