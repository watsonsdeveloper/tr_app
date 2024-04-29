// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploaded_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadedImage _$UploadedImageFromJson(Map<String, dynamic> json) {
  return _UploadedImage.fromJson(json);
}

/// @nodoc
mixin _$UploadedImage {
  int get trImageId => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedImageCopyWith<UploadedImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedImageCopyWith<$Res> {
  factory $UploadedImageCopyWith(
          UploadedImage value, $Res Function(UploadedImage) then) =
      _$UploadedImageCopyWithImpl<$Res, UploadedImage>;
  @useResult
  $Res call({int trImageId, String? imageUrl});
}

/// @nodoc
class _$UploadedImageCopyWithImpl<$Res, $Val extends UploadedImage>
    implements $UploadedImageCopyWith<$Res> {
  _$UploadedImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trImageId = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      trImageId: null == trImageId
          ? _value.trImageId
          : trImageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedImageImplCopyWith<$Res>
    implements $UploadedImageCopyWith<$Res> {
  factory _$$UploadedImageImplCopyWith(
          _$UploadedImageImpl value, $Res Function(_$UploadedImageImpl) then) =
      __$$UploadedImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int trImageId, String? imageUrl});
}

/// @nodoc
class __$$UploadedImageImplCopyWithImpl<$Res>
    extends _$UploadedImageCopyWithImpl<$Res, _$UploadedImageImpl>
    implements _$$UploadedImageImplCopyWith<$Res> {
  __$$UploadedImageImplCopyWithImpl(
      _$UploadedImageImpl _value, $Res Function(_$UploadedImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trImageId = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$UploadedImageImpl(
      trImageId: null == trImageId
          ? _value.trImageId
          : trImageId // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedImageImpl implements _UploadedImage {
  const _$UploadedImageImpl({required this.trImageId, this.imageUrl});

  factory _$UploadedImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedImageImplFromJson(json);

  @override
  final int trImageId;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'UploadedImage(trImageId: $trImageId, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedImageImpl &&
            (identical(other.trImageId, trImageId) ||
                other.trImageId == trImageId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, trImageId, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedImageImplCopyWith<_$UploadedImageImpl> get copyWith =>
      __$$UploadedImageImplCopyWithImpl<_$UploadedImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedImageImplToJson(
      this,
    );
  }
}

abstract class _UploadedImage implements UploadedImage {
  const factory _UploadedImage(
      {required final int trImageId,
      final String? imageUrl}) = _$UploadedImageImpl;

  factory _UploadedImage.fromJson(Map<String, dynamic> json) =
      _$UploadedImageImpl.fromJson;

  @override
  int get trImageId;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$UploadedImageImplCopyWith<_$UploadedImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
