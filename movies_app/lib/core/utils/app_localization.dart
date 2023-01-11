import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';

abstract class AppLocalization{
  static const List<Locale> supportedLocales=[englishLocale,arabicLocale];
  static const Locale defaultLocale=englishLocale;
  static const Locale englishLocale=Locale(AppConstants.englishCode,AppConstants.englishCountry);
  static const Locale arabicLocale=Locale(AppConstants.arabicCode,AppConstants.arabicCountry);
  static const String translationPath='assets/translations';
  static String apiLocaleCode=apiEnglishLocaleCode;
  static String apiEnglishLocaleCode='${AppConstants.englishCode}-${AppConstants.englishCountry}';
  static String apiArabicLocaleCode='${AppConstants.arabicCode}-${AppConstants.arabicCountry}';

  static void setApiLocalCode(String langCode){
    if(langCode==AppConstants.arabicCode){
      apiLocaleCode=apiArabicLocaleCode;
    }
    else if(langCode==AppConstants.englishCode){
      apiLocaleCode=apiEnglishLocaleCode;
    }
  }
}