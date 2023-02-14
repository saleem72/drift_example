//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/navigation/screens.dart';
import '../../../core/menu_feature/domain/models/product.dart';
import '../../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<RestaurantMenuBloc>().repository.cartItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        final items = snapshot.data ?? [];
        return IconButton(
          onPressed: () => Navigator.of(context).pushNamed(Screens.cart),
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart, size: 24),
              items.isEmpty
                  ? const SizedBox.shrink()
                  : AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Badge(
                        key: ValueKey<int>(items.length),
                        label: Text(items.length.toString()),
                        child: const SizedBox(height: 24, width: 24),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
