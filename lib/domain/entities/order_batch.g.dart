// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderBatchImpl _$$OrderBatchImplFromJson(Map<String, dynamic> json) =>
    _$OrderBatchImpl(
      trOrderBatchId: json['trOrderBatchId'] as int,
      trOrderBatchStatus:
          TrOrderBatchStatusFreezed.fromJson(json['trOrderBatchStatus'] as int),
      storeId: json['storeId'] as int,
      brand: BrandFreezed.fromJson(json['brand'] as int?),
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String?,
    );

Map<String, dynamic> _$$OrderBatchImplToJson(_$OrderBatchImpl instance) =>
    <String, dynamic>{
      'trOrderBatchId': instance.trOrderBatchId,
      'trOrderBatchStatus':
          TrOrderBatchStatusFreezed.toJson(instance.trOrderBatchStatus),
      'storeId': instance.storeId,
      'brand': BrandFreezed.toJson(instance.brand),
      'createdAt': instance.createdAt.toIso8601String(),
      'createdBy': instance.createdBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };
