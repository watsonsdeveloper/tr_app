import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/services/service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

abstract class TrService implements Service<Tr> {
  Future<Tr> getFilter(String storeId, String pluOrBarcode);
  Future<List<Tr>> getAllFilter(
      String storeId, Brand brand, TrStatus trStatus, String? pluOrBarcode);
}
