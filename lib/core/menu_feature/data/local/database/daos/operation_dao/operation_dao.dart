//

import 'package:drift/drift.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/local/database/entities/product_entity.dart';

import '../../entities/category_entity.dart';
import '../../entities/sub_category_entity.dart';

part 'operation_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [ProductEntity, CategoryEntity, SubCategoryEntity])
class OperationDAO extends DatabaseAccessor<AppDatabase>
    with _$OperationDAOMixin {
  OperationDAO(AppDatabase db) : super(db);

  Future<int> updateProduct(ProductEntityCompanion model) async {
    final id = await into(productEntity).insertOnConflictUpdate(model);
    return id;
  }

  Future addProductsList(List<ProductEntityCompanion> list) async {
    await batch((batch) {
      batch.insertAll(productEntity, list);
    });
  }

  Future clearProducts() async {
    await batch((batch) {
      batch.deleteAll(productEntity);
    });
  }

  Future addCategoriesList(List<CategoryEntityCompanion> list) async {
    await batch((batch) {
      batch.insertAll(categoryEntity, list);
    });
  }

  Future clearCategories() async {
    batch((batch) {
      batch.deleteAll(categoryEntity);
    });
  }

  Future addSubCategories(List<SubCategoryEntityCompanion> list) async {
    batch((batch) {
      batch.insertAll(subCategoryEntity, list);
    });
  }

  Future clearSubCategories() async {
    batch((batch) {
      batch.deleteAll(subCategoryEntity);
    });
  }

  Future clearDatabase() async {
    Future.wait([clearCategories(), clearSubCategories(), clearProducts()]);
  }

  Future clearCart() async {
    await update(productEntity).write(
      const ProductEntityCompanion(
        cartCount: Value(0),
      ),
    );
  }
}
