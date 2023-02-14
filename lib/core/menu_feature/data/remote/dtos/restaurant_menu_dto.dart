// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:drift_example/core/menu_feature/data/remote/dtos/category_dto.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/product_dto.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/subcategory_dto.dart';

class RestaurantMenuDTO {
  List<CategoryDTO> categories;
  List<SubcategoryDTO> subCategories;
  List<ProductDTO> products;
  RestaurantMenuDTO({
    required this.categories,
    required this.subCategories,
    required this.products,
  });
}
