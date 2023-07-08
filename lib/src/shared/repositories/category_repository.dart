import 'package:corelab_app_challenge/src/models/categories_list.dart';
import 'package:corelab_app_challenge/src/models/category_model.dart';

class CategoryRepository {
  static List<Category> load() {
    return categories;
  }
}
