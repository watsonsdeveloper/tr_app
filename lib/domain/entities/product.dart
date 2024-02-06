class Product {
  final String plu;
  final String productName;
  final String? imageUrl;
  final String supplierCode;
  final String supplierName;

  Product({
    required this.plu,
    required this.productName,
    required this.imageUrl,
    required this.supplierCode,
    required this.supplierName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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

  Product copyWith({
    String? plu,
    String? productName,
    String? imageUrl,
    String? supplierCode,
    String? supplierName,
  }) {
    return Product(
      plu: plu ?? this.plu,
      productName: productName ?? this.productName,
      imageUrl: imageUrl ?? this.imageUrl,
      supplierCode: supplierCode ?? this.supplierCode,
      supplierName: supplierName ?? this.supplierName,
    );
  }
}
