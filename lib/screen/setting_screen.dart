import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/controller/language_controller.dart';
import 'package:flutter_rest_api_blog/controller/theme_controller.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final ThemeController _themeController = Get.put(ThemeController());
  final LanguageController _languageController = Get.find();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          Obx((){
            return  Card(
              child: ListTile(
                  leading: const Text('Dark Theme'),
                  trailing: Switch(
                      value: _themeController.isDark.value,
                      onChanged: (value){
                        _themeController.setTheme(isLight: value);

                      })
              ),
            );
          }),
          Card(
            child: Obx((){
              return ListTile(
                leading: Text('မြန်မာဘာသာသို့ပြောင်းရန်'),
                trailing: Switch(
                    value: _languageController.isMyanmar.value ,
                    onChanged: (val){
                      _languageController.setLanguage(isEnglish: val);
                    }),
              );
            }),
          )
        ],
      ),
      
    );
  }
}