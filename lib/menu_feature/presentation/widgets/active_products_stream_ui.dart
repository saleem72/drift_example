//

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/menu_feature/domain/models/resturant_menu.dart';
import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'hero_product_ui_item.dart';
import 'product_ui_item.dart';

class ActiveProductsStreamUI extends StatefulWidget {
  const ActiveProductsStreamUI({
    super.key,
    required this.menu,
  });
  final RestaurantMenu menu;

  @override
  State<ActiveProductsStreamUI> createState() => _ActiveProductsStreamUIState();
}

class _ActiveProductsStreamUIState extends State<ActiveProductsStreamUI> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RestaurantMenuBloc, RestaurantMenuState>(
      listenWhen: (previous, current) {
        // return true/false to determine whether or not
        // to invoke listener with state
        if (previous is RestaurantMenuSuccess &&
            current is RestaurantMenuSuccess) {
          if (previous.menu.activeCategory != current.menu.activeCategory) {
            log("you should scroll back");
            return true;
          }
        }
        return false;
      },
      listener: (context, state) {
        // do stuff here based on BlocA's state
        _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeIn,
        );
      },
      child: StreamBuilder(
        stream:
            context.read<RestaurantMenuBloc>().repository.watchActiveProducts(
                  widget.menu.activeCategory ?? 0,
                  widget.menu.activeSubCategory,
                ),
        builder: (context, snapshot) {
          final products = snapshot.data ?? [];
          return ListView.builder(
            controller: _controller,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return HeroProductUiItem(product: products[index]);
            },
          );
        },
      ),
    );
  }
}
