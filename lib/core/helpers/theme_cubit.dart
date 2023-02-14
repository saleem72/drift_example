//

import 'package:drift_example/core/helpers/safe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final Safe _safe;
  ThemeCubit({required Safe safe})
      : _safe = safe,
        super(safe.getThemeMode());

  Future<ThemeMode> setThemeMode(ThemeMode mode) async {
    await _safe.setThemeMode(mode);
    emit(mode);
    return mode;
  }

  ThemeMode getThemeMode() {
    final themeMode = _safe.getThemeMode();
    return themeMode;
  }

  Future<ThemeMode> toggleThemeMode() {
    final isDarkMode = state == ThemeMode.dark;
    if (isDarkMode) {
      return setThemeMode(ThemeMode.light);
    } else {
      return setThemeMode(ThemeMode.dark);
    }
  }
}
