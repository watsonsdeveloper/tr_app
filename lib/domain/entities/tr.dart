import 'package:tr_app/utils/constants/enum_constants.dart';

class Tr {
  final String plu;
  final String productName;
  final String productDescription;
  final String requestDateTime;
  final TrStatus status;
  final String? productImageUrl;
  final List<String>? imageUrl;
  final String supplierCode;
  final String supplierName;

  // constructor
  Tr({
    required this.plu,
    required this.productName,
    required this.productDescription,
    required this.requestDateTime,
    required this.status,
    required this.supplierCode,
    required this.supplierName,
    this.productImageUrl,
    this.imageUrl,
  });

  // copy with
  Tr copyWith({
    String? plu,
    String? productName,
    String? productDescription,
    String? requestDateTime,
    TrStatus? status,
    String? productImageUrl,
    List<String>? imageUrl,
    String? supplierCode,
    String? supplierName,
  }) {
    return Tr(
      plu: plu ?? this.plu,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      requestDateTime: requestDateTime ?? this.requestDateTime,
      status: status ?? this.status,
      productImageUrl: productImageUrl ?? this.productImageUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      supplierCode: supplierCode ?? this.supplierCode,
      supplierName: supplierName ?? this.supplierName,
    );
  }
}
