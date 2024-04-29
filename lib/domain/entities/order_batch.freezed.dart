// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderBatch _$OrderBatchFromJson(Map<String, dynamic> json) {
  return _OrderBatch.fromJson(json);
}

/// @nodoc
mixin _$OrderBatch {
  int get trOrderBatchId => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TrOrderBatchStatusFreezed.fromJson,
      toJson: TrOrderBatchStatusFreezed.toJson)
  TrOrderBatchStatus get trOrderBatchStatus =>
      throw _privateConstructorUsedError;
  int get storeId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  Brand? get brand => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get updatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderBatchCopyWith<OrderBatch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderBatchCopyWith<$Res> {
  factory $OrderBatchCopyWith(
          OrderBatch value, $Res Function(OrderBatch) then) =
      _$OrderBatchCopyWithImpl<$Res, OrderBatch>;
  @useResult
  $Res call(
      {int trOrderBatchId,
      @JsonKey(
          fromJson: TrOrderBatchStatusFreezed.fromJson,
          toJson: TrOrderBatchStatusFreezed.toJson)
      TrOrderBatchStatus trOrderBatchStatus,
      int storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      Brand? brand,
      DateTime createdAt,
      String createdBy,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class _$OrderBatchCopyWithImpl<$Res, $Val extends OrderBatch>
    implements $OrderBatchCopyWith<$Res> {
  _$OrderBatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trOrderBatchId = null,
    Object? trOrderBatchStatus = null,
    Object? storeId = null,
    Object? brand = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      trOrderBatchId: null == trOrderBatchId
          ? _value.trOrderBatchId
          : trOrderBatchId // ignore: cast_nullable_to_non_nullable
              as int,
      trOrderBatchStatus: null == trOrderBatchStatus
          ? _value.trOrderBatchStatus
          : trOrderBatchStatus // ignore: cast_nullable_to_non_nullable
              as TrOrderBatchStatus,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$OrderBatchImplCopyWith<$Res>
    implements $OrderBatchCopyWith<$Res> {
  factory _$$OrderBatchImplCopyWith(
          _$OrderBatchImpl value, $Res Function(_$OrderBatchImpl) then) =
      __$$OrderBatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int trOrderBatchId,
      @JsonKey(
          fromJson: TrOrderBatchStatusFreezed.fromJson,
          toJson: TrOrderBatchStatusFreezed.toJson)
      TrOrderBatchStatus trOrderBatchStatus,
      int storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      Brand? brand,
      DateTime createdAt,
      String createdBy,
      DateTime? updatedAt,
      String? updatedBy});
}

/// @nodoc
class __$$OrderBatchImplCopyWithImpl<$Res>
    extends _$OrderBatchCopyWithImpl<$Res, _$OrderBatchImpl>
    implements _$$OrderBatchImplCopyWith<$Res> {
  __$$OrderBatchImplCopyWithImpl(
      _$OrderBatchImpl _value, $Res Function(_$OrderBatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trOrderBatchId = null,
    Object? trOrderBatchStatus = null,
    Object? storeId = null,
    Object? brand = freezed,
    Object? createdAt = null,
    Object? createdBy = null,
    Object? updatedAt = freezed,
    Object? updatedBy = freezed,
  }) {
    return _then(_$OrderBatchImpl(
      trOrderBatchId: null == trOrderBatchId
          ? _value.trOrderBatchId
          : trOrderBatchId // ignore: cast_nullable_to_non_nullable
              as int,
      trOrderBatchStatus: null == trOrderBatchStatus
          ? _value.trOrderBatchStatus
          : trOrderBatchStatus // ignore: cast_nullable_to_non_nullable
              as TrOrderBatchStatus,
      storeId: null == storeId
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as Brand?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$OrderBatchImpl implements _OrderBatch {
  const _$OrderBatchImpl(
      {required this.trOrderBatchId,
      @JsonKey(
          fromJson: TrOrderBatchStatusFreezed.fromJson,
          toJson: TrOrderBatchStatusFreezed.toJson)
      required this.trOrderBatchStatus,
      required this.storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      this.brand,
      required this.createdAt,
      required this.createdBy,
      this.updatedAt,
      this.updatedBy});

  factory _$OrderBatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderBatchImplFromJson(json);

  @override
  final int trOrderBatchId;
  @override
  @JsonKey(
      fromJson: TrOrderBatchStatusFreezed.fromJson,
      toJson: TrOrderBatchStatusFreezed.toJson)
  final TrOrderBatchStatus trOrderBatchStatus;
  @override
  final int storeId;
  @override
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  final Brand? brand;
  @override
  final DateTime createdAt;
  @override
  final String createdBy;
  @override
  final DateTime? updatedAt;
  @override
  final String? updatedBy;

  @override
  String toString() {
    return 'OrderBatch(trOrderBatchId: $trOrderBatchId, trOrderBatchStatus: $trOrderBatchStatus, storeId: $storeId, brand: $brand, createdAt: $createdAt, createdBy: $createdBy, updatedAt: $updatedAt, updatedBy: $updatedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderBatchImpl &&
            (identical(other.trOrderBatchId, trOrderBatchId) ||
                other.trOrderBatchId == trOrderBatchId) &&
            (identical(other.trOrderBatchStatus, trOrderBatchStatus) ||
                other.trOrderBatchStatus == trOrderBatchStatus) &&
            (identical(other.storeId, storeId) || other.storeId == storeId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trOrderBatchId,
      trOrderBatchStatus,
      storeId,
      brand,
      createdAt,
      createdBy,
      updatedAt,
      updatedBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderBatchImplCopyWith<_$OrderBatchImpl> get copyWith =>
      __$$OrderBatchImplCopyWithImpl<_$OrderBatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderBatchImplToJson(
      this,
    );
  }
}

abstract class _OrderBatch implements OrderBatch {
  const factory _OrderBatch(
      {required final int trOrderBatchId,
      @JsonKey(
          fromJson: TrOrderBatchStatusFreezed.fromJson,
          toJson: TrOrderBatchStatusFreezed.toJson)
      required final TrOrderBatchStatus trOrderBatchStatus,
      required final int storeId,
      @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
      final Brand? brand,
      required final DateTime createdAt,
      required final String createdBy,
      final DateTime? updatedAt,
      final String? updatedBy}) = _$OrderBatchImpl;

  factory _OrderBatch.fromJson(Map<String, dynamic> json) =
      _$OrderBatchImpl.fromJson;

  @override
  int get trOrderBatchId;
  @override
  @JsonKey(
      fromJson: TrOrderBatchStatusFreezed.fromJson,
      toJson: TrOrderBatchStatusFreezed.toJson)
  TrOrderBatchStatus get trOrderBatchStatus;
  @override
  int get storeId;
  @override
  @JsonKey(fromJson: BrandFreezed.fromJson, toJson: BrandFreezed.toJson)
  Brand? get brand;
  @override
  DateTime get createdAt;
  @override
  String get createdBy;
  @override
  DateTime? get updatedAt;
  @override
  String? get updatedBy;
  @override
  @JsonKey(ignore: true)
  _$$OrderBatchImplCopyWith<_$OrderBatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
