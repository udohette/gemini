import 'package:blade/app/resources/getx_localization/messages.dart';
import 'package:blade/app/resources/themes/thems.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/resources/routes/app_pages.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      translations: Message(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en','US'),
      title: "Gemini",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
