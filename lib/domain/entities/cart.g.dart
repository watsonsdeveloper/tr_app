// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      trCartId: json['trCartId'] as int?,
      plu: json['plu'] as String?,
      barcode: json['barcode'] as String?,
      productName: json['productName'] as String?,
      brandName: json['brandName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      storeId: json['storeId'] as int?,
      brand: BrandFreezed.fromJson(json['brand'] as int?),
      reason: ReasonFreezed.fromJson(json['reason'] as int?),
      justification: json['justification'] as String?,
      requireJustify: json['requireJustify'] as bool?,
      isAvailableStock: json['isAvailableStock'] as bool?,
      supplierName: json['supplierName'] as String?,
      supplierCode: json['supplierCode'] as String?,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      errorMessage: json['errorMessage'] as String?,
      uploadedImages: (json['uploadedImages'] as List<dynamic>?)
          ?.map((e) => UploadedImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'trCartId': instance.trCartId,
      'plu': instance.plu,
      'barcode': instance.barcode,
      'productName': instance.productName,
      'brandName': instance.brandName,
      'imageUrl': instance.imageUrl,
      'storeId': instance.storeId,
      'brand': BrandFreezed.toJson(instance.brand),
      'reason': ReasonFreezed.toJson(instance.reason),
      'justification': instance.justification,
      'requireJustify': instance.requireJustify,
      'isAvailableStock': instance.isAvailableStock,
      'supplierName': instance.supplierName,
      'supplierCode': instance.supplierCode,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'errorMessage': instance.errorMessage,
      'uploadedImages': instance.uploadedImages,
    };
