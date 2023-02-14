//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/helpers/translater.dart';
import '../../core/menu_feature/domain/models/product.dart';
import '../../core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'widgets/product_ui_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translator.translation(context).ourMenu),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: context.read<RestaurantMenuBloc>().repository.cartItems(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot) {
                final products = snapshot.data ?? [];
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SlidableCartItem(product: products[index]);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => context
                  .read<RestaurantMenuBloc>()
                  .add(RestaurantMenuClearCart()),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(Translator.translation(context).clear_cart),
            ),
          ),
        ],
      ),
    );
  }
}

class SlidableCartItem extends StatelessWidget {
  const SlidableCartItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Slidable(
              key: ValueKey(product.id),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                extentRatio: 0.25,
                children: [
                  SlidableAction(
                    onPressed: (context) => context
                        .read<RestaurantMenuBloc>()
                        .add(RestaurantMenuRemoveFromCart(product: product)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: ProductUiItem(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
