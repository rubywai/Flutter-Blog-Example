import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage{
  static const THEME = 'theme';
  static const LANG = 'language';
  SharedPreferences sharedPreferences = Get.find();
  Future<bool> setTheme(bool isDark) async{
    return sharedPreferences.setBool(THEME, isDark);
  }
  Future<bool> getTheme() async{
    return sharedPreferences.getBool(THEME) ?? true;
  }

  Future<bool> setLanguage(bool isMyanmar) async{
    return sharedPreferences.setBool(LANG, isMyanmar);
  }
  Future<bool> getLang() async{
    return sharedPreferences.getBool(LANG) ?? true;

  }

}