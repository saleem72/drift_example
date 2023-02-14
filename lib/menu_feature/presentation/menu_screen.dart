//

import 'package:drift_example/core/helpers/locale_cubit.dart';
import 'package:drift_example/core/helpers/theme_cubit.dart';
import 'package:drift_example/core/helpers/translater.dart';
import 'package:drift_example/core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/error_view.dart';
import '../../core/widgets/loading_view.dart';
import 'widgets/menu_view.dart';
import 'widgets/shopping_cart_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translator.translation(context).ourMenu),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LocaleCubit>().toggleLocale();
            },
            icon: const Icon(Icons.language_outlined),
          ),
          IconButton(
            onPressed: () {
              context.read<ThemeCubit>().toggleThemeMode();
            },
            icon: const Icon(Icons.dark_mode),
          ),
          const ShoppingCartButton(),
        ],
      ),
      body: const MenuScreenContent(),
    );
  }
}

class MenuScreenContent extends StatelessWidget {
  const MenuScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
      builder: (context, state) {
        if (state is RestaurantMenuLoading) {
          return const LoadingView(isLoading: true);
        }
        if (state is RestaurantMenuFailure) {
          return ErrorView(failure: state.failure);
        }
        if (state is RestaurantMenuSuccess) {
          return MenuView(menu: state.menu);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
