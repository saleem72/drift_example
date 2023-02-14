//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/menu_feature/domain/models/category.dart';
import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

class CategoryUiItem extends StatelessWidget {
  const CategoryUiItem({
    super.key,
    required this.category,
    this.activeCategory,
  });
  final Category category;
  final int? activeCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<RestaurantMenuBloc>()
          .add(RestaurantMenuSetSelectedCategory(categoryId: category.id)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(4),
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: category.id == activeCategory
              ? Theme.of(context).colorScheme.secondaryContainer
              : Colors.transparent,
        ),
        child: Center(child: Text(category.name)),
      ),
    );
  }
}
