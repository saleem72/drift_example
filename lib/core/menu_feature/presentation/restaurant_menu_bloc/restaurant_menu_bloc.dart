import 'package:bloc/bloc.dart';
import 'package:drift_example/core/helpers/failure.dart';
import 'package:drift_example/core/menu_feature/domain/models/product.dart';
import 'package:drift_example/core/menu_feature/domain/models/resturant_menu.dart';
import 'package:drift_example/core/menu_feature/domain/repository/menu_repository.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer';

part 'restaurant_menu_event.dart';
part 'restaurant_menu_state.dart';

class RestaurantMenuBloc
    extends Bloc<RestaurantMenuEvent, RestaurantMenuState> {
  final MenuRepository repository;

  RestaurantMenuBloc({
    required this.repository,
  }) : super(RestaurantMenuLoading()) {
    on<RestaurantMenuGetMenu>(_onGetMenu);
    on<RestaurantMenuGetSlider>(_onGetSlider);
    on<RestaurantMenuGetAllData>(_onGetAllData);
    on<RestaurantMenuSetSelectedCategory>(_onSetSelectedCategory);
    on<RestaurantMenuSetSelectedSubCategory>(_onSetSelectedSubCategory);
    on<RestaurantMenuIncrementProductAMount>(_onIncrementProductAMount);
    on<RestaurantMenuDecrementProductAMount>(_onDecrementProductAMount);
    on<RestaurantMenuClearCart>(_onClearCart);
    on<RestaurantMenuRemoveFromCart>(_onRemoveFromCart);
  }

  _onGetMenu(RestaurantMenuGetMenu event, Emitter<RestaurantMenuState> emit) {}

  _onGetSlider(
      RestaurantMenuGetSlider event, Emitter<RestaurantMenuState> emit) {}

  _onGetAllData(
      RestaurantMenuGetAllData event, Emitter<RestaurantMenuState> emit) async {
    emit(RestaurantMenuLoading());
    final reponse = await repository.getRestaurantManu();
    reponse.fold(
      (failure) =>
          {log(failure.message), emit(RestaurantMenuFailure(failure: failure))},
      (menu) => {emit(RestaurantMenuSuccess(menu: menu))},
    );
  }

  _onSetSelectedCategory(
    RestaurantMenuSetSelectedCategory event,
    Emitter<RestaurantMenuState> emit,
  ) async {
    final menu = await repository.setActiveCategory(event.categoryId);
    emit(RestaurantMenuSuccess(menu: menu));
  }

  _onSetSelectedSubCategory(
    RestaurantMenuSetSelectedSubCategory event,
    Emitter<RestaurantMenuState> emit,
  ) async {
    print(event.subCategoryId);
    final menu = await repository.setActiveSubCategory(event.subCategoryId);
    emit(RestaurantMenuSuccess(menu: menu));
  }

  _onIncrementProductAMount(
    RestaurantMenuIncrementProductAMount event,
    Emitter<RestaurantMenuState> emit,
  ) {
    final productToModify =
        event.product.copyWith(cartCount: event.product.cartCount + 1);
    repository.updateProduct(productToModify);
  }

  _onDecrementProductAMount(
    RestaurantMenuDecrementProductAMount event,
    Emitter<RestaurantMenuState> emit,
  ) {
    if (event.product.cartCount == 0) {
      return;
    }
    final productToModify =
        event.product.copyWith(cartCount: event.product.cartCount - 1);
    repository.updateProduct(productToModify);
  }

  _onClearCart(
      RestaurantMenuClearCart event, Emitter<RestaurantMenuState> emit) {
    repository.clearCart();
  }

  _onRemoveFromCart(
      RestaurantMenuRemoveFromCart event, Emitter<RestaurantMenuState> emit) {
    repository.removeProductFromCart(event.product);
  }
}
