//

import 'package:drift/drift.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/domain/models/category.dart';

import '../remote/dtos/category_dto.dart';

extension CategoryDtoMapper on CategoryDTO {
  Category toCategory() {
    return Category(
      id: id ?? 0,
      isActive: isActive == null ? false : isActive! == 1,
      name: name ?? "",
      restaurantId: restaurantId ?? 0,
      sort: sort ?? 0,
    );
  }

  CategoryEntityCompanion toCategoryEntity(int index) {
    return CategoryEntityCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ""),
      isActive: Value(isActive == null ? false : isActive! == 1),
      restaurantId: Value(restaurantId ?? 0),
      sort: Value(index),
    );
  }
}

extension CategoryEntityDataMapper on CategoryEntityData {
  Category toCategory() {
    return Category(
      id: id,
      isActive: isActive,
      name: name,
      restaurantId: restaurantId,
      sort: sort,
    );
  }
}

extension CategoryMapper on Category {
  CategoryEntityCompanion toCategoryEntity() {
    return CategoryEntityCompanion(
      id: Value(id),
      name: Value(name),
      isActive: Value(isActive),
      restaurantId: Value(restaurantId),
      sort: Value(sort),
    );
  }
}
