//

import 'package:drift_example/core/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/navigation/screens.dart';
import '../../../core/menu_feature/domain/models/product.dart';
import '../../../core/widgets/url_image.dart';
import 'cart_item_control_ui.dart';

class ProductUiItem extends StatelessWidget {
  const ProductUiItem({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(Screens.productDetails, arguments: product),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        UrlImage(url: product.image),
                        Text(product.id.toString())
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CartItemControlUi(product: product),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
