// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/binding
// *******************************


import 'package:get/get.dart';
import 'package:resume_builder/controller/resume_controller.dart';

class ResumeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ResumeController());
  }

}