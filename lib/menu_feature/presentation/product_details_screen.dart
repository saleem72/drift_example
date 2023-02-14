//

import 'package:drift_example/core/menu_feature/domain/models/product.dart';
import 'package:drift_example/core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helpers/constants.dart';
import '../../core/widgets/app_top_header.dart';
import '../../core/widgets/url_image.dart';
import 'widgets/watched_product_ui.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.grey.shade300),
                alignment: Alignment.center,
                child: Hero(
                  tag: "${Constants.productImageTag}_${product.id.toString()}",
                  child: UrlImage(url: product.image),
                ),
              ),
              const SafeArea(child: AppTopHeader(title: ""))
            ],
          ),
          const SizedBox(height: 16),
          StreamBuilder(
            stream: context
                .read<RestaurantMenuBloc>()
                .repository
                .watchProduct(product.id),
            builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
              final watchedProduct = snapshot.data;
              if (watchedProduct == null) {
                return const SizedBox.shrink();
              } else {
                return WatchedProductUi(product: watchedProduct);
              }
            },
          ),
        ],
      ),
    );
  }
}
