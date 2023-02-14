//

import 'package:drift_example/core/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/menu_feature/domain/models/product.dart';
import '../../../core/widgets/app_top_header.dart';
import '../../../core/widgets/url_image.dart';
import 'cart_item_control_ui.dart';

class WatchedProductUi extends StatelessWidget {
  const WatchedProductUi({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(product.name),
              CartItemControlUi(product: product),
            ],
          ),
        )
      ],
    );
  }
}
