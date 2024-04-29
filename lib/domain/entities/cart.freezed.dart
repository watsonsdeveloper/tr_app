// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  int? get trCartId => throw _privateConstructorUsedError;
  String? get plu => throw _privateConstructorUsedError;
  String? get barcode => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  Brand? get brand => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  Reason? get reason => throw _privateConstructorUsedError;
  String? get justification => throw _privateConstructorUsedError;
  bool? get requireJustify => throw _privateConstructorUsedError;
  bool? get isAvailableStock => throw _privateConstructorUsedError;
  String? get supplierName => throw _privateConstructorUsedError;
  String? get supplierCode => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<UploadedImage>? get uploadedImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {int? trCartId,
      String? plu,
      String? barcode,
      String? productName,
      String? brandName,
      String? imageUrl,
      int? storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      Brand? brand,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      Reason? reason,
      String? justification,
      bool? requireJustify,
      bool? isAvailableStock,
      String? supplierName,
      String? supplierCode,
      String? createdBy,
      DateTime? createdAt,
      String? errorMessage,
      List<UploadedImage>? uploadedImages});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trCartId = freezed,
    Object? plu = freezed,
    Object? barcode = freezed,
    Object? productName = freezed,
    Object? brandName = freezed,
    Object? imageUrl = freezed,
    Object? storeId = freezed,
    Object? brand = freezed,
    Object? reason = freezed,
    Object? justification = freezed,
    Object? requireJustify = freezed,
    Object? isAvailableStock = freezed,
    Object? supplierName = freezed,
    Object? supplierCode = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? errorMessage = freezed,
    Object? uploadedImages = freezed,
  }) {
    return _then(_value.copyWith(
      trCartId: freezed == trCartId
          ? _value.trCartId
          : trCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      plu: freezed == plu
          ? _value.plu
          : plu // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason?,
      justification: freezed == justification
          ? _value.justification
          : justification // ignore: cast_nullable_to_non_nullable
              as String?,
      requireJustify: freezed == requireJustify
          ? _value.requireJustify
          : requireJustify // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailableStock: freezed == isAvailableStock
          ? _value.isAvailableStock
          : isAvailableStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierCode: freezed == supplierCode
          ? _value.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: freezed == uploadedImages
          ? _value.uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<UploadedImage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? trCartId,
      String? plu,
      String? barcode,
      String? productName,
      String? brandName,
      String? imageUrl,
      int? storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      Brand? brand,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      Reason? reason,
      String? justification,
      bool? requireJustify,
      bool? isAvailableStock,
      String? supplierName,
      String? supplierCode,
      String? createdBy,
      DateTime? createdAt,
      String? errorMessage,
      List<UploadedImage>? uploadedImages});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trCartId = freezed,
    Object? plu = freezed,
    Object? barcode = freezed,
    Object? productName = freezed,
    Object? brandName = freezed,
    Object? imageUrl = freezed,
    Object? storeId = freezed,
    Object? brand = freezed,
    Object? reason = freezed,
    Object? justification = freezed,
    Object? requireJustify = freezed,
    Object? isAvailableStock = freezed,
    Object? supplierName = freezed,
    Object? supplierCode = freezed,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? errorMessage = freezed,
    Object? uploadedImages = freezed,
  }) {
    return _then(_$CartImpl(
      trCartId: freezed == trCartId
          ? _value.trCartId
          : trCartId // ignore: cast_nullable_to_non_nullable
              as int?,
      plu: freezed == plu
          ? _value.plu
          : plu // ignore: cast_nullable_to_non_nullable
              as String?,
      barcode: freezed == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeId: freezed == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason?,
      justification: freezed == justification
          ? _value.justification
          : justification // ignore: cast_nullable_to_non_nullable
              as String?,
      requireJustify: freezed == requireJustify
          ? _value.requireJustify
          : requireJustify // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAvailableStock: freezed == isAvailableStock
          ? _value.isAvailableStock
          : isAvailableStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      supplierName: freezed == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierCode: freezed == supplierCode
          ? _value.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedImages: freezed == uploadedImages
          ? _value._uploadedImages
          : uploadedImages // ignore: cast_nullable_to_non_nullable
              as List<UploadedImage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {this.trCartId,
      this.plu,
      this.barcode,
      this.productName,
      this.brandName,
      this.imageUrl,
      this.storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      this.brand,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      this.reason,
      this.justification,
      this.requireJustify,
      this.isAvailableStock,
      this.supplierName,
      this.supplierCode,
      this.createdBy,
      this.createdAt,
      this.errorMessage,
      final List<UploadedImage>? uploadedImages})
      : _uploadedImages = uploadedImages;

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  final int? trCartId;
  @override
  final String? plu;
  @override
  final String? barcode;
  @override
  final String? productName;
  @override
  final String? brandName;
  @override
  final String? imageUrl;
  @override
  final int? storeId;
  @override
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  final Brand? brand;
  @override
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  final Reason? reason;
  @override
  final String? justification;
  @override
  final bool? requireJustify;
  @override
  final bool? isAvailableStock;
  @override
  final String? supplierName;
  @override
  final String? supplierCode;
  @override
  final String? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final String? errorMessage;
  final List<UploadedImage>? _uploadedImages;
  @override
  List<UploadedImage>? get uploadedImages {
    final value = _uploadedImages;
    if (value == null) return null;
    if (_uploadedImages is EqualUnmodifiableListView) return _uploadedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Cart(trCartId: $trCartId, plu: $plu, barcode: $barcode, productName: $productName, brandName: $brandName, imageUrl: $imageUrl, storeId: $storeId, brand: $brand, reason: $reason, justification: $justification, requireJustify: $requireJustify, isAvailableStock: $isAvailableStock, supplierName: $supplierName, supplierCode: $supplierCode, createdBy: $createdBy, createdAt: $createdAt, errorMessage: $errorMessage, uploadedImages: $uploadedImages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.trCartId, trCartId) ||
                other.trCartId == trCartId) &&
            (identical(other.plu, plu) || other.plu == plu) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.justification, justification) ||
                other.justification == justification) &&
            (identical(other.requireJustify, requireJustify) ||
                other.requireJustify == requireJustify) &&
            (identical(other.isAvailableStock, isAvailableStock) ||
                other.isAvailableStock == isAvailableStock) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.supplierCode, supplierCode) ||
                other.supplierCode == supplierCode) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._uploadedImages, _uploadedImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trCartId,
      plu,
      barcode,
      productName,
      brandName,
      imageUrl,
      storeId,
      brand,
      reason,
      justification,
      requireJustify,
      isAvailableStock,
      supplierName,
      supplierCode,
      createdBy,
      createdAt,
      errorMessage,
      const DeepCollectionEquality().hash(_uploadedImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {final int? trCartId,
      final String? plu,
      final String? barcode,
      final String? productName,
      final String? brandName,
      final String? imageUrl,
      final int? storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      final Brand? brand,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      final Reason? reason,
      final String? justification,
      final bool? requireJustify,
      final bool? isAvailableStock,
      final String? supplierName,
      final String? supplierCode,
      final String? createdBy,
      final DateTime? createdAt,
      final String? errorMessage,
      final List<UploadedImage>? uploadedImages}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  int? get trCartId;
  @override
  String? get plu;
  @override
  String? get barcode;
  @override
  String? get productName;
  @override
  String? get brandName;
  @override
  String? get imageUrl;
  @override
  int? get storeId;
  @override
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  Brand? get brand;
  @override
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  Reason? get reason;
  @override
  String? get justification;
  @override
  bool? get requireJustify;
  @override
  bool? get isAvailableStock;
  @override
  String? get supplierName;
  @override
  String? get supplierCode;
  @override
  String? get createdBy;
  @override
  DateTime? get createdAt;
  @override
  String? get errorMessage;
  @override
  List<UploadedImage>? get uploadedImages;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
