import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/use_cases/tr_use_case.dart';
import 'package:tr_app/presentation/providers/tr_list_provider.dart';
import 'package:tr_app/presentation/view_models/tr_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';

final trSNProvider = StateNotifierProvider<TrNotifier, TrState>((ref) {
  final trService = ref.watch(trServiceProvider);
  final user = ref.watch(userNotifierProvider).user;
  return TrNotifier(trService, user!);
});
