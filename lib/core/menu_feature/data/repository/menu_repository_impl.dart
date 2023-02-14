// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:dartz/dartz.dart';
import 'package:collection/collection.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/mappers/category_mapper.dart';
import 'package:drift_example/core/menu_feature/data/mappers/product_mapper.dart';
import 'package:drift_example/core/menu_feature/data/mappers/sub_category_mapper.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/category_dto.dart';
import 'package:drift_example/core/menu_feature/domain/models/product.dart';
import 'package:drift_example/core/menu_feature/domain/models/resturant_menu.dart';
import 'package:drift_example/core/menu_feature/domain/repository/menu_repository.dart';

import '../../../helpers/failure.dart';
import '../service/menu_service.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuService _service;
  final AppDatabase _db;
  int? _activeCategory;
  int? _activeSubCategory;

  MenuRepositoryImpl({
    required MenuService service,
    required AppDatabase db,
  })  : _service = service,
        _db = db;

  @override
  Future<Either<Failure, RestaurantMenu>> getRestaurantManu() async {
    final categories = await _db.queriesDAO.getAllCategories;
    if (categories.isNotEmpty) {
      return Right(await _readFromDatabase(true));
    }

    final result = await _getRestaurantManuFromApi();
    return result.fold(
      (failure) => Left(failure),
      (_) async => Right(await _readFromDatabase(true)),
    );
  }

  Future<RestaurantMenu> _readDatabaseWholeContents() async {
    final queriesDAO = _db.queriesDAO;

    late List<CategoryEntityData> categories;
    late List<SubCategoryEntityData> subCategories;
    late List<ProductEntityData> products;

    await Future.wait<void>([
      queriesDAO.getAllCategories.then((result) => categories = result),
      queriesDAO.getAllSubCategories.then((result) => subCategories = result),
      queriesDAO.getAllProducts.then((result) => products = result),
    ]);

    return RestaurantMenu(
      categories: categories.map((e) => e.toCategory()).toList(),
      subCategories: subCategories.map((e) => e.toSubCategory()).toList(),
    );
  }

  Future<RestaurantMenu> _readFromDatabase(bool isItFirst) async {
    final queriesDAO = _db.queriesDAO;

    final categories = await queriesDAO.getAllCategories;
    if (isItFirst) {
      _activeCategory = categories.firstOrNull?.id;
      _activeSubCategory = null;
    }
    if (_activeCategory == null) {
      return const RestaurantMenu();
    }
    late List<SubCategoryEntityData> subCategories;

    await Future.wait<void>([
      queriesDAO
          .getSubCategoriesForCategory(_activeCategory!)
          .then((result) => subCategories = result),
    ]);

    return RestaurantMenu(
      categories: categories.map((e) => e.toCategory()).toList(),
      subCategories: subCategories.map((e) => e.toSubCategory()).toList(),
      activeCategory: _activeCategory,
      activeSubCategory: _activeSubCategory,
    );
  }

  Future<RestaurantMenu> _readFromDatabaseForSubCategory(bool isItFirst) async {
    final queriesDAO = _db.queriesDAO;

    final categories = await queriesDAO.getAllCategories;
    if (isItFirst) {
      _activeCategory = categories.firstOrNull?.id;
      _activeSubCategory = null;
    }
    if (_activeCategory == null) {
      return const RestaurantMenu();
    }
    late List<SubCategoryEntityData> subCategories;
    late List<ProductEntityData> products;
    if (_activeSubCategory == null) {
      await Future.wait<void>([
        queriesDAO
            .getSubCategoriesForCategory(_activeCategory!)
            .then((result) => subCategories = result),
        queriesDAO
            .getProductsForCategory(_activeCategory!)
            .then((result) => products = result),
      ]);
    } else {
      await Future.wait<void>([
        queriesDAO
            .getSubCategoriesForCategory(_activeCategory!)
            .then((result) => subCategories = result),
        queriesDAO
            .getProductsForSubCategory(_activeSubCategory!)
            .then((result) => products = result),
      ]);
    }

    return RestaurantMenu(
      categories: categories.map((e) => e.toCategory()).toList(),
      subCategories: subCategories.map((e) => e.toSubCategory()).toList(),
      activeCategory: _activeCategory,
      activeSubCategory: _activeSubCategory,
    );
  }

  Future<Either<Failure, bool>> _getRestaurantManuFromApi() async {
    try {
      final remoteCategories = await _service.getCategories();
      await _extractMenu(remoteCategories);
      return const Right(true);
    } catch (ex) {
      return Left(Failure(message: ex.toString()));
    }
  }

  Future _extractMenu(List<CategoryDTO> remoteCategories) async {
    List<ProductEntityCompanion> products = [];
    List<SubCategoryEntityCompanion> subCategories = [];

    List<CategoryEntityCompanion> categories = [];
    remoteCategories.asMap().forEach((index, value) {
      categories.add(value.toCategoryEntity(index));
      value.subcategories?.forEach((subcategory) {
        final newProducts =
            subcategory.products?.map((e) => e.toProductEntity()).toList() ??
                [];
        products.addAll(newProducts);
        subCategories.add(subcategory.toSubCategoryEntity());
      });
    });

    await _writeNewDatabase(categories, subCategories, products);
  }

  Future _writeNewDatabase(
    List<CategoryEntityCompanion> categories,
    List<SubCategoryEntityCompanion> subCategories,
    List<ProductEntityCompanion> products,
  ) async {
    final operationDAO = _db.operationDAO;
    await operationDAO.clearDatabase();

    await operationDAO.addCategoriesList(categories);
    await operationDAO.addSubCategories(subCategories);
    await operationDAO.addProductsList(products);
  }

  @override
  Future<Either<Failure, List<Product>>> getRestaurantSlider() async {
    // try {
    //   final remoteProducts = await _service.getSliderData();
    //   final products = remoteProducts.map((e) => e.toProduct()).toList();
    //   return Right(products);
    // } catch (ex) {
    //   return Left(Failure(message: ex.toString()));
    // }
    return Left(Failure(message: "Not implemented yet!"));
  }

  @override
  Stream<List<Product>> watchActiveProducts(
      int categoryId, int? subcategoryId) {
    return _db.queriesDAO
        .watchActiveProducts(
          categoryId: categoryId,
          subCategoryId: subcategoryId,
        )
        .map((list) => list.map((e) => e.toProduct()).toList());
  }

  @override
  Future<RestaurantMenu> setActiveCategory(int categoryId) async {
    _activeCategory = categoryId;
    _activeSubCategory = null;
    return await _readFromDatabase(false);
  }

  @override
  Future<RestaurantMenu> setActiveSubCategory(int? activeSubCategory) async {
    _activeSubCategory = activeSubCategory;
    return await _readFromDatabase(false);
  }

  @override
  Future updateProduct(Product product) async {
    final model = product.toProductEntity();
    await _db.operationDAO.updateProduct(model);
  }

  @override
  Stream<Product> watchProduct(int productId) {
    return _db.queriesDAO
        .watchProduct(productId)
        .map((event) => event.toProduct());
  }

  @override
  Stream<List<Product>> cartItems() {
    return _db.queriesDAO
        .watchCart()
        .map((event) => event.map((e) => e.toProduct()).toList());
  }

  @override
  Future clearCart() async {
    await _db.operationDAO.clearCart();
  }

  @override
  Future removeProductFromCart(Product product) async {
    final model = product.copyWith(cartCount: 0).toProductEntity();
    return await _db.operationDAO.updateProduct(model);
  }
}
