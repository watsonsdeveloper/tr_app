import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_image.freezed.dart';
part 'uploaded_image.g.dart';

@freezed
sealed class UploadedImage with _$UploadedImage {
  const factory UploadedImage({
    required int trImageId,
    String? imageUrl,
  }) = _UploadedImage;

  factory UploadedImage.fromJson(Map<String, dynamic> json) =>
      _$UploadedImageFromJson(json);
}

// class UploadedImage {
//   final int trImageId;
//   final String? imageUrl;

//   UploadedImage(this.trImageId, this.imageUrl);

//   factory UploadedImage.fromJson(Map<String, dynamic> json) {
//     return UploadedImage(
//       json['trImageId'],
//       json['imageUrl'],
//     );
//   }
// }
