import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_localization.dart';

class DioHelper{
  static Dio? _dio;

  static Dio _init()=> _dio?? (_dio=Dio());

  static Future<Response> get({required String url})async{
    _init();
    return await _dio!.get(url,queryParameters: {
      KeyConstants.languageKey : AppLocalization.apiLocaleCode
    });
  }
}