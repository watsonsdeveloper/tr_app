import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/utils/constants.dart';

final activeStatusProvider =
    StateProvider<StatusState>((ref) => StatusState.all);
