import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/tr_service.dart';
import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/services/tr_service.dart';
import 'package:tr_app/domain/use_cases/tr_list_use_case.dart';
import 'package:tr_app/presentation/providers/product_provider.dart';
import 'package:tr_app/presentation/view_models/tr_list_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

final trListActiveStatusProvider =
    StateProvider<TrStatus>((ref) => TrStatus.all);

final trListSearchProvider = StateProvider<String?>((ref) => null);

final trServiceProvider = Provider<TrService>((ref) {
  return TrServiceImpl();
});

final trListSNP = StateNotifierProvider<TrListNotifier, TrListState>((ref) {
  try {
    final trService = ref.watch(trServiceProvider);
    final productService = ref.watch(productServiceProvider);
    final User? user = ref.watch(userNotifierProvider).user;
    if (user == null) {
      ref.read(userNotifierProvider.notifier).getUser();
    }
    return TrListNotifier(trService, productService, user!);
  } catch (e) {
    throw Exception(e.toString());
  }
});

final trListFutureProvider = FutureProvider.autoDispose<List<Tr>>((ref) async {
  try {
    final pluOrBarcode = ref.watch(trListSearchProvider);
    final activeStatus = ref.watch(trListActiveStatusProvider);
    final selectedBrand = ref.watch(userNotifierProvider).user!.selectedBrand;
    await ref
        .read(trListSNP.notifier)
        .getTrs(selectedBrand, activeStatus, pluOrBarcode);
    return ref.watch(trListSNP).trList;
  } catch (e) {
    throw Exception(e.toString());
  }
});
