enum TrStatus { all, approved, pending, rejected }

enum TrOrderStatus {
  all,
  pending,
  approved,
  rejected,
  processed,
  fulfilled,
  unfulfilled,
  cancelled
}

enum TrOrderBatchStatus { all, pending, processed }

enum Reason { none, newListing, damaged, depleted, missing, expired }

enum Brand { none, own, supplier }

extension TrStatusFreezed on TrStatus {
  static int toJson(TrStatus reason) {
    return reason.index; // Convert enum to int
  }

  static TrStatus fromJson(int value) {
    return TrStatus.values.firstWhere((element) => element.index == value);
  }
}

extension TrOrderStatusFreezed on TrOrderStatus {
  static int toJson(TrOrderStatus reason) {
    return reason.index; // Convert enum to int
  }

  static TrOrderStatus fromJson(int? value) {
    return TrOrderStatus.values.firstWhere((element) => element.index == value);
  }
}

extension TrOrderBatchStatusFreezed on TrOrderBatchStatus {
  static int toJson(TrOrderBatchStatus reason) {
    return reason.index; // Convert enum to int
  }

  static TrOrderBatchStatus fromJson(int value) {
    return TrOrderBatchStatus.values
        .firstWhere((element) => element.index == value);
  }
}

extension ReasonFreezed on Reason {
  static int? toJson(Reason? reason) {
    return reason?.index; // Convert enum to int
  }

  static Reason? fromJson(int? value) {
    return value != null
        ? Reason.values.firstWhere(
            (element) => element.index == value,
            orElse: () => Reason.none, // Default value or error handling
          )
        : null;
  }
}

extension BrandFreezed on Brand {
  static int? toJson(Brand? brand) {
    return brand?.index; // Convert enum to int
  }

  static Brand? fromJson(int? value) {
    return value != null
        ? Brand.values.firstWhere(
            (element) => element.index == value,
            orElse: () => Brand.none, // Default value or error handling
          )
        : null;
  }
}
