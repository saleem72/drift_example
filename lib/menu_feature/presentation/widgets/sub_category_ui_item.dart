//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/menu_feature/domain/models/sub_category.dart';
import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

class SubCategoryUiItem extends StatelessWidget {
  const SubCategoryUiItem({
    super.key,
    required this.subCategory,
    required this.activeSubCategory,
  });
  final Subcategory subCategory;
  final int? activeSubCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<RestaurantMenuBloc>().add(
          RestaurantMenuSetSelectedSubCategory(subCategoryId: subCategory.id)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(4),
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: activeSubCategory == subCategory.id
              ? Theme.of(context).colorScheme.secondaryContainer
              : Colors.transparent,
        ),
        child: Text(subCategory.name),
      ),
    );
  }
}
