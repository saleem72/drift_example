//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/menu_feature/domain/models/product.dart';
import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

class CartItemControlUi extends StatelessWidget {
  const CartItemControlUi({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => context
              .read<RestaurantMenuBloc>()
              .add(RestaurantMenuIncrementProductAMount(product: product)),
          icon: const Icon(Icons.add_circle),
        ),
        const SizedBox(width: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Text(
            product.cartCount.toString(),
            key: ValueKey<int>(product.cartCount),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () => context
              .read<RestaurantMenuBloc>()
              .add(RestaurantMenuDecrementProductAMount(product: product)),
          icon: const Icon(Icons.remove_circle),
        ),
      ],
    );
  }
}
