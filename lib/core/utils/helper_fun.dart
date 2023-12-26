// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/core/utils
// *******************************

import 'package:get/get.dart';

class HelperFun{

  static buildSnackBar(String message){
    if(message.isEmpty)return;
    Get.rawSnackbar(
      duration: const Duration(milliseconds: 1500),
      message: message,
    );
  }

}