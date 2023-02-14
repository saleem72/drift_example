//

import 'package:drift_example/core/menu_feature/data/remote/dtos/category_dto.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/product_dto.dart';

abstract class MenuService {
  Future<List<CategoryDTO>> getCategories();
  Future<List<ProductDTO>> getSliderData();
}
