class UploadedImage {
  final int trImageId;
  final String? imageUrl;

  UploadedImage(this.trImageId, this.imageUrl);

  factory UploadedImage.fromJson(Map<String, dynamic> json) {
    return UploadedImage(
      json['trImageId'],
      json['imageUrl'],
    );
  }
}
