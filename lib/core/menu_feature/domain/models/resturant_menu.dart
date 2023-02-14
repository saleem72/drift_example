// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:equatable/equatable.dart';

import 'category.dart';
import 'sub_category.dart';

class RestaurantMenu extends Equatable {
  final List<Category> categories;
  final List<Subcategory> subCategories;
  final int? activeCategory;
  final int? activeSubCategory;

  const RestaurantMenu({
    this.categories = const [],
    this.subCategories = const [],
    this.activeCategory,
    this.activeSubCategory,
  });

  @override
  List<Object?> get props => [
        categories,
        subCategories,
        activeCategory,
        activeSubCategory,
      ];
}
