import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{

  //final _box = GetStorage();
  final _key = 'isDarkMode';


  //Get the ThemeMode from  local Storage
  //ThemeMode get theme => _loadTheme() ? ThemeMode.dark: ThemeMode.light;
  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark: ThemeMode.light;
  //bool _loadTheme() => _box.read(_key) ?? false;

  //void saveTheme(bool isDarkMode) => _box.write(_key, isDarkMode);
  void changeTheme(ThemeData themeData) => Get.changeTheme(themeData);
  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  @override
  void onInit() {
    //defaultTheme();
    if (kDebugMode) {
      print("Printing Default Key======   $_key");
    }
    super.onInit();
  }

  void defaultTheme(){
    if(Get.isDarkMode){
      changeThemeMode(ThemeMode.light);
     // saveTheme(false);

    }else{
      changeThemeMode(ThemeMode.dark);
      //saveTheme(true);
    }

  }
}