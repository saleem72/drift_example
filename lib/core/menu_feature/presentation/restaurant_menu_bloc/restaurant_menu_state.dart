// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'restaurant_menu_bloc.dart';

abstract class RestaurantMenuState extends Equatable {
  const RestaurantMenuState();

  @override
  List<Object> get props => [];
}

class RestaurantMenuLoading extends RestaurantMenuState {}

class RestaurantMenuSuccess extends RestaurantMenuState {
  final RestaurantMenu menu;
  const RestaurantMenuSuccess({
    required this.menu,
  });
  @override
  List<Object> get props => [menu];
}

class RestaurantMenuFailure extends RestaurantMenuState {
  final Failure failure;
  const RestaurantMenuFailure({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
