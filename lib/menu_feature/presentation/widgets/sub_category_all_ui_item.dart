//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

class SubCategoryAllUiItem extends StatelessWidget {
  const SubCategoryAllUiItem({super.key, required this.activeSubCategory});
  final int? activeSubCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<RestaurantMenuBloc>()
          .add(const RestaurantMenuSetSelectedSubCategory(subCategoryId: null)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(4),
        height: 22,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: activeSubCategory == null
              ? Theme.of(context).colorScheme.secondaryContainer
              : Colors.transparent,
        ),
        child: const Text("All"),
      ),
    );
  }
}
