import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper{
  static late SharedPreferences _instance;
  static Future init() async {
    _instance=await SharedPreferences.getInstance();
  }

  static Future setBool({required String key,required bool value}) async{
    await _instance.setBool(key, value);
  }

  static bool getBool({required String key,required bool defaultValue}){
    final value= _instance.getBool(key)?? defaultValue;
    return value;
  }
}