//

import 'package:drift_example/core/helpers/safe.dart';
import 'package:drift_example/core/menu_feature/data/local/database/app_database.dart';
import 'package:drift_example/core/menu_feature/data/remote/api_service/menu_api_service.dart';
import 'package:drift_example/core/menu_feature/data/repository/menu_repository_impl.dart';
import 'package:drift_example/core/menu_feature/domain/repository/menu_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/menu_feature/data/service/menu_service.dart';
import 'core/menu_feature/presentation/restaurant_menu_bloc/restaurant_menu_bloc.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  final shared = await SharedPreferences.getInstance();

  locator.registerSingleton(Safe(storage: shared));
  locator.registerSingleton(AppDatabase());
  locator.registerSingleton<MenuService>(MenuApiService());
  locator.registerSingleton<MenuRepository>(
      MenuRepositoryImpl(service: locator(), db: locator()));
  locator.registerSingleton(RestaurantMenuBloc(repository: locator()));
}
