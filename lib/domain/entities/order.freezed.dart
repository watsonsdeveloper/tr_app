// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int get trOrderId => throw _privateConstructorUsedError;
  String get plu => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String? get productImageUrl => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  Reason? get reason => throw _privateConstructorUsedError;
  String? get justification => throw _privateConstructorUsedError;
  String get supplierName => throw _privateConstructorUsedError;
  String get supplierCode => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TrOrderStatusFreezed.fromJson,
      toJson: TrOrderStatusFreezed.toJson)
  TrOrderStatus get trOrderStatus => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int trOrderId,
      String plu,
      String barcode,
      String productName,
      String brandName,
      String? productImageUrl,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      Reason? reason,
      String? justification,
      String supplierName,
      String supplierCode,
      @JsonKey(
          fromJson: TrOrderStatusFreezed.fromJson,
          toJson: TrOrderStatusFreezed.toJson)
      TrOrderStatus trOrderStatus,
      String? createdBy,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trOrderId = null,
    Object? plu = null,
    Object? barcode = null,
    Object? productName = null,
    Object? brandName = null,
    Object? productImageUrl = freezed,
    Object? reason = freezed,
    Object? justification = freezed,
    Object? supplierName = null,
    Object? supplierCode = null,
    Object? trOrderStatus = null,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      trOrderId: null == trOrderId
          ? _value.trOrderId
          : trOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      plu: null == plu
          ? _value.plu
          : plu // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason?,
      justification: freezed == justification
          ? _value.justification
          : justification // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierCode: null == supplierCode
          ? _value.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String,
      trOrderStatus: null == trOrderStatus
          ? _value.trOrderStatus
          : trOrderStatus // ignore: cast_nullable_to_non_nullable
              as TrOrderStatus,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int trOrderId,
      String plu,
      String barcode,
      String productName,
      String brandName,
      String? productImageUrl,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      Reason? reason,
      String? justification,
      String supplierName,
      String supplierCode,
      @JsonKey(
          fromJson: TrOrderStatusFreezed.fromJson,
          toJson: TrOrderStatusFreezed.toJson)
      TrOrderStatus trOrderStatus,
      String? createdBy,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trOrderId = null,
    Object? plu = null,
    Object? barcode = null,
    Object? productName = null,
    Object? brandName = null,
    Object? productImageUrl = freezed,
    Object? reason = freezed,
    Object? justification = freezed,
    Object? supplierName = null,
    Object? supplierCode = null,
    Object? trOrderStatus = null,
    Object? createdBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$OrderImpl(
      trOrderId: null == trOrderId
          ? _value.trOrderId
          : trOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      plu: null == plu
          ? _value.plu
          : plu // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      productImageUrl: freezed == productImageUrl
          ? _value.productImageUrl
          : productImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as Reason?,
      justification: freezed == justification
          ? _value.justification
          : justification // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierCode: null == supplierCode
          ? _value.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String,
      trOrderStatus: null == trOrderStatus
          ? _value.trOrderStatus
          : trOrderStatus // ignore: cast_nullable_to_non_nullable
              as TrOrderStatus,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedBy: freezed == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.trOrderId,
      required this.plu,
      required this.barcode,
      required this.productName,
      required this.brandName,
      this.productImageUrl,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      this.reason,
      this.justification,
      required this.supplierName,
      required this.supplierCode,
      @JsonKey(
          fromJson: TrOrderStatusFreezed.fromJson,
          toJson: TrOrderStatusFreezed.toJson)
      required this.trOrderStatus,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.updatedBy});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int trOrderId;
  @override
  final String plu;
  @override
  final String barcode;
  @override
  final String productName;
  @override
  final String brandName;
  @override
  final String? productImageUrl;
  @override
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  final Reason? reason;
  @override
  final String? justification;
  @override
  final String supplierName;
  @override
  final String supplierCode;
  @override
  @JsonKey(
      fromJson: TrOrderStatusFreezed.fromJson,
      toJson: TrOrderStatusFreezed.toJson)
  final TrOrderStatus trOrderStatus;
  @override
  final String? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'Order(trOrderId: $trOrderId, plu: $plu, barcode: $barcode, productName: $productName, brandName: $brandName, productImageUrl: $productImageUrl, reason: $reason, justification: $justification, supplierName: $supplierName, supplierCode: $supplierCode, trOrderStatus: $trOrderStatus, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.trOrderId, trOrderId) ||
                other.trOrderId == trOrderId) &&
            (identical(other.plu, plu) || other.plu == plu) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.productImageUrl, productImageUrl) ||
                other.productImageUrl == productImageUrl) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.justification, justification) ||
                other.justification == justification) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.supplierCode, supplierCode) ||
                other.supplierCode == supplierCode) &&
            (identical(other.trOrderStatus, trOrderStatus) ||
                other.trOrderStatus == trOrderStatus) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trOrderId,
      plu,
      barcode,
      productName,
      brandName,
      productImageUrl,
      reason,
      justification,
      supplierName,
      supplierCode,
      trOrderStatus,
      createdBy,
      createdAt,
      updatedAt,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final int trOrderId,
      required final String plu,
      required final String barcode,
      required final String productName,
      required final String brandName,
      final String? productImageUrl,
      @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
      final Reason? reason,
      final String? justification,
      required final String supplierName,
      required final String supplierCode,
      @JsonKey(
          fromJson: TrOrderStatusFreezed.fromJson,
          toJson: TrOrderStatusFreezed.toJson)
      required final TrOrderStatus trOrderStatus,
      final String? createdBy,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final String? updatedBy}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int get trOrderId;
  @override
  String get plu;
  @override
  String get barcode;
  @override
  String get productName;
  @override
  String get brandName;
  @override
  String? get productImageUrl;
  @override
  @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
  Reason? get reason;
  @override
  String? get justification;
  @override
  String get supplierName;
  @override
  String get supplierCode;
  @override
  @JsonKey(
      fromJson: TrOrderStatusFreezed.fromJson,
      toJson: TrOrderStatusFreezed.toJson)
  TrOrderStatus get trOrderStatus;
  @override
  String? get createdBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
