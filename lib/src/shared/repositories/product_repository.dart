import 'package:corelab_app_challenge/src/models/product_model.dart';
import 'package:corelab_app_challenge/src/models/products_list.dart';

class ProductRepository {
  static List<Product> load() {
    return products;
  }
}
