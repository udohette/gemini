import 'dart:ui';

import 'package:get/get.dart';

class MessageController extends GetxController{

  void changeLanguage(String lanCode, String lanCountry){
    var locale = Locale(lanCode, lanCountry);
    Get.updateLocale(locale);

  }
}