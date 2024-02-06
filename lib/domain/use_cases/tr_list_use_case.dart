import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/services/product_service.dart';
import 'package:tr_app/domain/services/tr_service.dart';
import 'package:tr_app/presentation/view_models/tr_list_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class TrListNotifier extends StateNotifier<TrListState> {
  final TrService _trService;
  final ProductService _productService;
  final User _user;

  TrListNotifier(this._trService, this._productService, this._user)
      : super(TrListState());

  Future<void> getTrs(Brand brand, TrStatus? status, String? plu) async {
    try {
      status ??= TrStatus.all;
      List<Tr> trList =
          await _trService.getAllFilter(_user.storeId!, brand, status, plu);
      List<Tr> updatedTrList = [];
      var cachedImageList = <String, String>{};
      for (var tr in trList) {
        if (cachedImageList.keys.contains(tr.plu)) {
          updatedTrList
              .add(tr.copyWith(productImageUrl: cachedImageList[tr.plu]));
          continue;
        } else {
          var productImageUrl = await _productService.getRetekImageUrl(tr.plu);
          updatedTrList.add(tr.copyWith(productImageUrl: productImageUrl));
          if (productImageUrl != null) {
            cachedImageList[tr.plu] = productImageUrl;
          }
        }
      }
      state = state.copyWith(trList: updatedTrList, isLoading: false);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<Tr> getTr(int id) async {
  //   return await _trRepository.getTr(id);
  // }

  // Future<int> insertTr(Tr tr) async {
  //   return await _trRepository.insertTr(tr);
  // }

  // Future<int> updateTr(Tr tr) async {
  //   return await _trRepository.updateTr(tr);
  // }

  // Future<int> deleteTr(int id) async {
  //   return await _trRepository.deleteTr(id);
  // }
}
