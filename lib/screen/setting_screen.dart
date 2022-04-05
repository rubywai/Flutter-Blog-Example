import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatefulWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _darkTheme = false;
  bool _mmLanguage = false;
  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;
    _darkTheme = (brightness == Brightness.dark);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Text('Dark Theme'),
              trailing: Switch(value: _darkTheme, 
              onChanged: (value){
                if(value){
                  Get.changeTheme(ThemeData.dark());
                }
                else{
                  Get.changeTheme(ThemeData.light());
                }
                setState(() {
                   _darkTheme = value;
                });
                 
              }),
            ),
          ),
          Card(
            child: ListTile(
              leading: Text('မြန်မာဘာသာသို့ပြောင်းရန်'),
              trailing: Switch(value: _mmLanguage , 
              onChanged: (val){
                if(val){
                  Get.updateLocale(Locale('en','MM'));
                }
                else {
                  Get.updateLocale(Locale('en','US'));
                }
                setState(() {
                  _mmLanguage = val;
                });
              }),
            ),
          )
        ],
      ),
      
    );
  }
}