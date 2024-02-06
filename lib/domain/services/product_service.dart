import 'package:tr_app/domain/entities/product.dart';
import 'package:tr_app/domain/services/service.dart';

abstract class ProductService implements Service<Product> {
  Future<Product> getFilter(String pluOrBarcode);
  Future<String?> getRetekImageUrl(String pluOrBarcode);
}
