import 'package:tr_app/domain/entities/uploaded_image.dart';
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
  final Reason? reason;
  final String? justification;
  final bool? requireJustify;
  final bool? isAvailableStock;
  final String? supplierName;
  final String? supplierCode;
  final String? createdBy;
  final DateTime? createdAt;
  final String? errorMessage;
  final List<UploadedImage>? uploadedImages;

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
      this.errorMessage,
      this.uploadedImages});

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
        reason: json['reason'] != null ? Reason.values[json['reason']] : null,
        justification: json['justification'],
        requireJustify: json['requireJustify'],
        isAvailableStock: json['isAvailableStock'],
        supplierName: json['supplierName'],
        supplierCode: json['supplierCode'],
        createdBy: json['createdBy'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
        errorMessage: json['errorMessage'],
        uploadedImages: json['uploadedImages'] != null
          ? (json['uploadedImages'] as List<dynamic>)
            .map((uploadedImage) => UploadedImage.fromJson(uploadedImage as Map<String, dynamic>))
            .toList()
          : null);
  }

  Cart copyWith({
    int? trCartId,
    String? plu,
    String? barcode,
    String? productName,
    String? brandName,
    String? imageUrl,
    int? storeId,
    Brand? brand,
    Reason? reason,
    String? justification,
    bool? requireJustify,
    bool? isAvailableStock,
    String? supplierName,
    String? supplierCode,
    String? createdBy,
    DateTime? createdAt,
    String? errorMessage,
    List<UploadedImage>? uploadedImages,
  }) {
    return Cart(
      trCartId: trCartId ?? this.trCartId,
      plu: plu ?? this.plu,
      barcode: barcode ?? this.barcode,
      productName: productName ?? this.productName,
      brandName: brandName ?? this.brandName,
      imageUrl: imageUrl ?? this.imageUrl,
      storeId: storeId ?? this.storeId,
      brand: brand ?? this.brand,
      reason: reason ?? this.reason,
      justification: justification ?? this.justification,
      requireJustify: requireJustify ?? this.requireJustify,
      isAvailableStock: isAvailableStock ?? this.isAvailableStock,
      supplierName: supplierName ?? this.supplierName,
      supplierCode: supplierCode ?? this.supplierCode,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      errorMessage: errorMessage ?? this.errorMessage,
      uploadedImages: uploadedImages ?? this.uploadedImages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trCartId': trCartId,
      'reason': reason,
      'justification': justification,
    };
  }
}
