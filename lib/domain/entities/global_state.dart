class GlobalState {
  final String? storeIP;

  GlobalState({
    this.storeIP,
  });

  // copy with
  GlobalState copyWith({
    String? storeIP,
  }) {
    return GlobalState(
      storeIP: storeIP ?? this.storeIP,
    );
  }
}
