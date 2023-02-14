// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'restaurant_menu_bloc.dart';

abstract class RestaurantMenuEvent extends Equatable {
  const RestaurantMenuEvent();

  @override
  List<Object> get props => [];
}

class RestaurantMenuGetMenu extends RestaurantMenuEvent {}

class RestaurantMenuGetSlider extends RestaurantMenuEvent {}

class RestaurantMenuGetAllData extends RestaurantMenuEvent {}

class RestaurantMenuSetSelectedCategory extends RestaurantMenuEvent {
  final int categoryId;
  const RestaurantMenuSetSelectedCategory({
    required this.categoryId,
  });
}

class RestaurantMenuSetSelectedSubCategory extends RestaurantMenuEvent {
  final int? subCategoryId;

  const RestaurantMenuSetSelectedSubCategory({
    required this.subCategoryId,
  });
}

class RestaurantMenuIncrementProductAMount extends RestaurantMenuEvent {
  final Product product;
  const RestaurantMenuIncrementProductAMount({
    required this.product,
  });
}

class RestaurantMenuDecrementProductAMount extends RestaurantMenuEvent {
  final Product product;
  const RestaurantMenuDecrementProductAMount({
    required this.product,
  });
}

class RestaurantMenuClearCart extends RestaurantMenuEvent {}

class RestaurantMenuRemoveFromCart extends RestaurantMenuEvent {
  final Product product;
  const RestaurantMenuRemoveFromCart({
    required this.product,
  });
}
