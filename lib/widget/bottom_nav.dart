import 'package:flutter/material.dart';
import 'package:flutter_rest_api_blog/screen/home.dart';
import 'package:flutter_rest_api_blog/screen/setting_screen.dart';
import 'package:flutter_rest_api_blog/screen/upload_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  Widget _body = Home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add),label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
        ],
        onTap: (int index){
         setState(() {
           _currentIndex = index;
           if(index == 0){
             _body = Home();
           }
           else if(index == 1){
             _body = UploadScreen();
           }
           else if(index == 2){
             _body = Setting();
           }
         });
        },

      ),
    );
  }
}