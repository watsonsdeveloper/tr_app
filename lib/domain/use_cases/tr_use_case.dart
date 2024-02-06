import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/services/tr_service.dart';
import 'package:tr_app/presentation/view_models/tr_view_model.dart';

class TrNotifier extends StateNotifier<TrState> {
  final TrService _trService;
  final User _user;

  TrNotifier(this._trService, this._user) : super(TrState());

  Future<TrState> getTr(String? pluOrBarcode) async {
    try {
      state = state.copyWith(isLoading: true);
      Tr tr = await _trService.getFilter(_user.storeId!, pluOrBarcode!);
      state = state.copyWith(tr: tr, isLoading: false);
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLoading: false);
    }
    return state;
  }
}
