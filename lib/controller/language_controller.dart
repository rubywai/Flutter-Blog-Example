

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/storage/shared_preference.dart';

class LanguageController extends GetxController {
  final Storage _storage = Get.put(Storage());
  RxBool isMyanmar = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getLanguage();

  }
  void setLanguage({required bool isEnglish}) async{
    _storage.setLanguage(isEnglish);
    _getLanguage();
  }
  void _getLanguage(){
    _storage.getLang()
        .then((value) {
      if (value) {
        Get.updateLocale(Locale('en', 'MM'));
        isMyanmar.value = true;
      }
      else {
        Get.updateLocale(Locale('en', 'US'));
        isMyanmar.value = false;
      }
    });
  }
}
