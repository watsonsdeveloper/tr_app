import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

part 'order.freezed.dart';
part 'order.g.dart';

// class Order {
//   final int trOrderId;
//   final String plu;
//   final String barcode;
//   final String productName;
//   final String brandName;
//   final String? productImageUrl;
//   final Reason? reason;
//   final String? justification;
//   final String supplierName;
//   final String supplierCode;
//   final TrOrderStatus trOrderStatus;
//   final String? createdBy;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? updatedBy;

//   Order({
//     required this.trOrderId,
//     required this.plu,
//     required this.barcode,
//     required this.productName,
//     required this.brandName,
//     required this.supplierName,
//     required this.supplierCode,
//     required this.trOrderStatus,
//     this.createdAt,
//     this.reason,
//     this.justification,
//     this.productImageUrl,
//     this.createdBy,
//     this.updatedAt,
//     this.updatedBy,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       trOrderId: json['trOrderId'],
//       plu: json['plu'],
//       barcode: json['barcode'],
//       productName: json['productName'],
//       brandName: json['brandName'],
//       productImageUrl: json['productImageUrl'],
//       reason: json['reason'] != null ? Reason.values[json['reason']] : null,
//       justification: json['justification'],
//       supplierName: json['supplierName'],
//       supplierCode: json['supplierCode'],
//       trOrderStatus: TrOrderStatus.values[json['trOrderStatus']],
//       createdBy: json['createdBy'],
//       createdAt:
//           json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
//       updatedAt:
//           json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
//       updatedBy: json['updatedBy'],
//     );
//   }
// }

@freezed
sealed class Order with _$Order {
  // const Order._();
  const factory Order({
    required int trOrderId,
    required String plu,
    required String barcode,
    required String productName,
    required String brandName,
    String? productImageUrl,
    @JsonKey(fromJson: ReasonFreezed.fromJson, toJson: ReasonFreezed.toJson)
    Reason? reason,
    String? justification,
    required String supplierName,
    required String supplierCode,
    @JsonKey(
        fromJson: TrOrderStatusFreezed.fromJson,
        toJson: TrOrderStatusFreezed.toJson)
    // @Default(TrOrderStatus.all)
    required TrOrderStatus trOrderStatus,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? updatedBy
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
