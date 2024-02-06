import 'package:tr_app/domain/entities/tr.dart';

class TrListState {
  final List<Tr> trList;
  final String? errorMessage;
  final bool isLoading;

  TrListState({
    this.trList = const [],
    this.errorMessage,
    this.isLoading = false,
  });

  // copyWith
  TrListState copyWith({
    List<Tr>? trList,
    String? errorMessage,
    bool? isLoading,
  }) {
    return TrListState(
      trList: trList ?? this.trList,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
