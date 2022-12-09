import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/language_controller.dart';
import 'package:flutter_rest_api_blog/controller/theme_controller.dart';
import 'package:flutter_rest_api_blog/data/api_service/post_api_service.dart';
import 'package:flutter_rest_api_blog/screen/home.dart';
import 'package:flutter_rest_api_blog/utils/locale.dart';
import 'package:flutter_rest_api_blog/widget/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  Get.put(ThemeController());
  Get.put(LanguageController());
  Get.put(PostApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      translations: RestApiLanguage(),
      fallbackLocale: const Locale('en',"US"),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const BottomNav(),

    );
  }
}