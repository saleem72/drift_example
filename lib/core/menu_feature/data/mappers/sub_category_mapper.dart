//

import 'package:drift/drift.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/subcategory_dto.dart';
import 'package:drift_example/core/menu_feature/domain/models/sub_category.dart';

extension SubCategoryDtoMapper on SubcategoryDTO {
  Subcategory toSubCategory() {
    return Subcategory(
      id: id ?? 0,
      isActive: isActive == null ? false : isActive! == 1,
      name: name ?? "",
      parentId: parentId ?? 0,
      restaurantId: restaurantId ?? 0,
      sort: sort ?? 0,
    );
  }

  SubCategoryEntityCompanion toSubCategoryEntity() {
    return SubCategoryEntityCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ""),
      isActive: Value(isActive == null ? false : isActive! == 1),
      parentId: Value(parentId ?? 0),
      restaurantId: Value(restaurantId ?? 0),
      sort: Value(sort ?? 0),
    );
  }
}

extension SubCategoryEntityDataMapper on SubCategoryEntityData {
  Subcategory toSubCategory() {
    return Subcategory(
      id: id,
      isActive: isActive,
      name: name,
      parentId: parentId,
      restaurantId: restaurantId,
      sort: sort,
    );
  }
}
