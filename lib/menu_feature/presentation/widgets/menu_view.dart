//

import 'package:flutter/material.dart';

import '../../../core/helpers/translater.dart';
import '../../../core/menu_feature/domain/models/resturant_menu.dart';
import 'Sub_Category_all_ui_item.dart';
import 'active_products_stream_uI.dart';
import 'category_ui_item.dart';
import 'sub_category_ui_item.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
    required this.menu,
  });
  final RestaurantMenu menu;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                  "${Translator.translation(context).categories}: ${menu.categories.length.toString()}"),
              Text(
                  "${Translator.translation(context).sub_categories}: ${menu.subCategories.length.toString()}"),
            ],
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: menu.categories.length,
            itemBuilder: (BuildContext context, int index) {
              return CategoryUiItem(
                category: menu.categories[index],
                activeCategory: menu.activeCategory,
              );
            },
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: menu.subCategories.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SubCategoryAllUiItem(
                    activeSubCategory: menu.activeSubCategory);
              } else {
                final sub = menu.subCategories[index - 1];
                return SubCategoryUiItem(
                  subCategory: sub,
                  activeSubCategory: menu.activeSubCategory,
                );
              }
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ActiveProductsStreamUI(menu: menu),
        )
      ],
    );
  }
}
