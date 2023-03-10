// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:drift_example/core/helpers/safe.dart';
import 'package:flutter/material.dart';

class LocaleCubit extends Cubit<Locale> {
  final Safe _safe;
  LocaleCubit({required Safe safe})
      : _safe = safe,
        super(safe.getLocal());

  Future<Locale> setLocal(String languageCode) async {
    final local = await _safe.setLocal(languageCode);
    emit(local);
    return local;
  }

  Locale getLocal() {
    final local = _safe.getLocal();
    return local;
  }

  Future<Locale> toggleLocale() {
    final isEnglish = state.languageCode == "en";
    if (isEnglish) {
      return setLocal("ar");
    } else {
      return setLocal("en");
    }
  }
}
