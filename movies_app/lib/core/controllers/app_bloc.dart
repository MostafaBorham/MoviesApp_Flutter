import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/helpers/shared_pref_helper.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_localization.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  static late bool isDark;

  AppBloc() : super(AppInitial()) {
    on<ChangeLocalizationEvent>(_changeLocalization);
    on<ChangeAppModeEvent>(_changeAppMode);
  }

  FutureOr<void> _changeLocalization(
      ChangeLocalizationEvent event, Emitter<AppState> emit) {
    Locale newLocale = AppLocalization.englishLocale;
    if (EasyLocalization.of(event.context)!.locale == newLocale) {
      newLocale = AppLocalization.arabicLocale;
    }
    AppLocalization.setApiLocalCode(newLocale.languageCode);
    emit(ChangeLocalizationState(locale: newLocale));
  }

  FutureOr<void> _changeAppMode(ChangeAppModeEvent event, Emitter<AppState> emit) async{
    isDark=event.isDarkMode;
    await SharedPrefHelper.setBool(key: KeyConstants.modeKey, value: event.isDarkMode);
    emit(event.isDarkMode? DarkAppModeState() : LightAppModeState());
  }
}
