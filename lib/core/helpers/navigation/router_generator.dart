//

import 'package:drift_example/menu_feature/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../../../menu_feature/presentation/menu_screen.dart';
import '../../../menu_feature/presentation/product_details_screen.dart';
import '../../menu_feature/domain/models/product.dart';
import 'navigation_error_screen.dart';
import 'screens.dart';

class RouterGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Screens.home:
        return MaterialPageRoute(builder: (context) => const MenuScreen());

      case Screens.productDetails:
        final product = args as Product?;
        if (product != null) {
          return MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product));
        } else {
          return MaterialPageRoute(
              builder: (_) => const NavigationErrorScreen(
                  error: "you have to pass a product"));
        }
      case Screens.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => NavigationErrorScreen(
                error: "${settings.name} is not valid route"));
    }
  }
}
