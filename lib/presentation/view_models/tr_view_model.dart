import 'package:tr_app/domain/entities/tr.dart';

class TrState {
  final Tr? tr;
  final String? errorMessage;
  final bool isLoading;

  TrState({
    this.tr,
    this.errorMessage,
    this.isLoading = false,
  });

  TrState copyWith({
    Tr? tr,
    String? errorMessage,
    bool? isLoading,
  }) {
    return TrState(
      tr: tr ?? this.tr,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
