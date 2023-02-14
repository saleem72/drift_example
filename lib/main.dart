import 'package:drift_example/core/helpers/locale_cubit.dart';
import 'package:drift_example/core/helpers/theme_cubit.dart';
import 'package:drift_example/core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';
import 'package:drift_example/dependancy_injection.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drift_example_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LocaleCubit(safe: di.locator())),
        BlocProvider(create: (_) => ThemeCubit(safe: di.locator())),
        BlocProvider(
          lazy: false,
          create: (context) => di.locator<RestaurantMenuBloc>()
            ..add(
              RestaurantMenuGetAllData(),
            ),
        )
      ],
      child: const DriftExampleApp(),
    );
  }
}
