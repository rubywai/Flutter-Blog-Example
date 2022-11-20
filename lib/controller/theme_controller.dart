

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/storage/shared_preference.dart';

class ThemeController extends GetxController{
  final Storage _storage = Get.put(Storage());
  RxBool isDark = false.obs;
  @override
  void onInit() {
    super.onInit();
    _getTheme();

  }
  void setTheme({required bool isLight}) async{
    await _storage.setTheme(isLight);
    _getTheme();
  }
  void _getTheme(){
    _storage.getTheme()
        .then((value){
      if(value){
        Get.changeThemeMode(ThemeMode.dark);
        isDark.value = true;
      }
      else{
        Get.changeThemeMode(ThemeMode.light);
        isDark.value = false;
      }
    });
  }
}