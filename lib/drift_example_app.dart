//

import 'package:drift_example/core/helpers/navigation/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/helpers/locale_cubit.dart';
import 'core/helpers/navigation/screens.dart';
import 'core/helpers/theme.dart';
import 'core/helpers/theme_cubit.dart';

class DriftExampleApp extends StatelessWidget {
  const DriftExampleApp({super.key});
  // final Locale locale;
  // final ThemeMode themeMode;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: context.select<LocaleCubit, Locale>((value) => value.state),
      themeMode: context.select<ThemeCubit, ThemeMode>((value) => value.state),
      onGenerateRoute: RouterGenerator.generate,
      initialRoute: Screens.home,
    );
  }
}
