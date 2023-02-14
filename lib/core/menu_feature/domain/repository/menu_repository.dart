//

import 'package:dartz/dartz.dart';
import 'package:drift_example/core/helpers/failure.dart';
import 'package:drift_example/core/menu_feature/domain/models/product.dart';
import 'package:drift_example/core/menu_feature/domain/models/resturant_menu.dart';

abstract class MenuRepository {
  Future<Either<Failure, RestaurantMenu>> getRestaurantManu();
  Future<Either<Failure, List<Product>>> getRestaurantSlider();
  Stream<List<Product>> watchActiveProducts(int categoryId, int? subcategoryId);
  Stream<Product> watchProduct(int productId);
  Future<RestaurantMenu> setActiveCategory(int categoryId);
  Future<RestaurantMenu> setActiveSubCategory(int? activeSubCategory);
  Future updateProduct(Product product);
  Stream<List<Product>> cartItems();
  Future clearCart();
  Future removeProductFromCart(Product product);
}
