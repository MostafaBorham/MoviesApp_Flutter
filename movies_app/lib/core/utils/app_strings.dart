import 'package:easy_localization/easy_localization.dart';

abstract class AppStrings{
  static String appName="appName";
  static String popular="popular";
  static String topRated="topRated";
  static String genresColon="genresColon";
  static String moreLikeThis="moreLikeThis";
  static String nowPlaying="nowPlaying";
  static String seeMore="seeMore";
  static String languageBtn="languageBtn";
  static String logout="logout";
  static String appMode="changeMode";

  static String translate(String word)=> word.tr();
}