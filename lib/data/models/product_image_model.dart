class ProductImage {
  final String? imageName;
  final String? imagePath;
  final String? imageType;

  ProductImage({
    this.imageName,
    this.imagePath,
    this.imageType,
  });

  ProductImage copyWith({
    String? imageName,
    String? imagePath,
    String? imageType,
  }) {
    return ProductImage(
      imageName: imageName ?? this.imageName,
      imagePath: imagePath ?? this.imagePath,
      imageType: imageType ?? this.imageType,
    );
  }

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      imageName: json['imageName'],
      imagePath: json['imagePath'],
      imageType: json['imageType'],
    );
  }
}
