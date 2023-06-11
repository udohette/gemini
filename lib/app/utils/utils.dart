import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../resources/colors/app_color.dart';



class Utils {

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    /*Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.blackColor,
      gravity: ToastGravity.CENTER,
    );*/
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: AppColor.scaffoldBackground,
      backgroundColor: AppColor.grey,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}