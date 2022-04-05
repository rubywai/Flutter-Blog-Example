import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/screen/home.dart';
import 'package:flutter_rest_api_blog/utils/locale.dart';
import 'package:flutter_rest_api_blog/widget/bottom_nav.dart';
import 'package:get/get.dart';
void main() {
  Get.put(PostApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      translations: RestApiLanguage(),
      locale: const Locale('en',"US"),
      fallbackLocale: const Locale('en',"US"),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const BottomNav(),
      
    );
  }
}