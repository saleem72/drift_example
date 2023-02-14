//

import 'package:drift/drift.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/category_entity.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/product_entity.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/sub_category_entity.dart';

part 'queries_dao.g.dart';

@DriftAccessor(tables: [ProductEntity, CategoryEntity, SubCategoryEntity])
class QueriesDAO extends DatabaseAccessor<AppDatabase> with _$QueriesDAOMixin {
  QueriesDAO(AppDatabase db) : super(db);

  Future<List<CategoryEntityData>> get getAllCategories =>
      select(categoryEntity).get();

  Future<List<SubCategoryEntityData>> get getAllSubCategories =>
      select(subCategoryEntity).get();

  Future<List<SubCategoryEntityData>> getSubCategoriesForCategory(
          int categoryId) =>
      (select(subCategoryEntity)
            ..where((tbl) => tbl.parentId.equals(categoryId)))
          .get();

  Future<List<ProductEntityData>> get getAllProducts =>
      select(productEntity).get();

  Future<List<ProductEntityData>> getProductsForSubCategory(int categoryId) =>
      (select(productEntity)..where((tbl) => tbl.categoryId.equals(categoryId)))
          .get();

  Future<List<ProductEntityData>> getProductsForCategory(int categoryId) {
    return (select(productEntity).join([
      leftOuterJoin(subCategoryEntity,
          subCategoryEntity.id.equalsExp(productEntity.categoryId)),
    ])
          ..where(subCategoryEntity.parentId.equals(categoryId)))
        .map((p0) => p0.readTable(productEntity))
        .get();
  }

  Stream<List<ProductEntityData>> watchActiveProducts(
      {required int categoryId, int? subCategoryId}) {
    late Selectable<ProductEntityData> query;
    if (subCategoryId == null) {
      query = (select(productEntity).join([
        leftOuterJoin(subCategoryEntity,
            subCategoryEntity.id.equalsExp(productEntity.categoryId)),
      ])
            ..where(subCategoryEntity.parentId.equals(categoryId)))
          .map((p0) => p0.readTable(productEntity));
    } else {
      query = select(productEntity)
        ..where((tbl) => tbl.categoryId.equals(subCategoryId));
    }
    return query.watch();
  }

  Stream<ProductEntityData> watchProduct(int productId) {
    return (select(productEntity)
          ..where((tbl) => tbl.productId.equals(productId)))
        .watchSingle();
  }

  Stream<List<ProductEntityData>> watchCart() {
    return (select(productEntity)
          ..where((tbl) => tbl.cartCount.isBiggerOrEqualValue(1)))
        .watch();
  }
}
