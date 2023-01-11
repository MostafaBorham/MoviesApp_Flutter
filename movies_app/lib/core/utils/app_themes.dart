import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class AppTheme{
  static ThemeData themeLight({bool isEnglish=true}) => ThemeData(
    dialogBackgroundColor: Colors.white,
    brightness: Brightness.light,
    canvasColor: Colors.black,
    primaryColor: const Color(0xff2CB9B0),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xffF5F6FA),
    disabledColor: const Color(0xffe9e9e9),
    errorColor: ColorLight.error,
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.cyan,
      scrimColor: Colors.white
    ),
    hintColor: const Color(0xff9099A4),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    indicatorColor: const Color(0xff2CB9B0),
    primaryIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.coinsActionColor),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(5)),
      fillColor: AppColors.bg,
      filled: true,
    ),
    fontFamily: isEnglish?"Poppins":"alfont_com",
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noThumb),
  );
  static ThemeData darkTheme({bool isEnglish=true}) {
    return ThemeData(
      sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noThumb),
      fontFamily: isEnglish?"Poppins":"alfont_com",
      primaryColor: const Color(0xff2CB9B0),
      brightness: Brightness.dark,
      dialogBackgroundColor: const Color(0xff282C43),
      scaffoldBackgroundColor: const Color(0xff282C43),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: const Color(0xff2F334E),
      cardColor: ColorDark.card,
      disabledColor: ColorLight.disabledButton,
      errorColor: ColorDark.error,
      hintColor: ColorDark.fontSubtitle,
      drawerTheme: DrawerThemeData(
          backgroundColor: Colors.cyan.shade900,
          scrimColor: Colors.black54
      ),
      indicatorColor: const Color(0xff2CB9B0),
      canvasColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.coinsActionColor),
            borderRadius: BorderRadius.circular(5)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(5)),
        fillColor: AppColors.bg,
        filled: true,
      ),
    );
  }
}