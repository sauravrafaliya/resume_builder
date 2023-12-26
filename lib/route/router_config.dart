// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/route
// *******************************

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:resume_builder/binding/home_binding.dart';
import 'package:resume_builder/binding/resume_preview_binding.dart';
import 'package:resume_builder/screen/home/home_screen.dart';
import 'package:resume_builder/screen/resume/resume_preview_screen.dart';
import 'package:resume_builder/screen/starter_screen.dart';

import '../binding/resume_binding.dart';
import '../screen/resume/resume_screen.dart';

class AppRoute{

  static String starterScreen = '/';
  static String homeScreen = '/home';
  static String resumePreviewScreen = '/resume_preview';
  static String resumeScreen = '/resume';

  static List<GetPage> pages = [
    GetPage(
        name: starterScreen,
        page: () => const StarterScreen(),
      transition: Transition.fade
    ),
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.fade
    ),
    GetPage(
        name: resumePreviewScreen,
        page: () => ResumePreviewScreen(),
        binding: ResumePreviewBinding(),
        transition: Transition.fade
    ),
    GetPage(
        name: resumeScreen,
        page: () => const ResumeScreen(),
        binding: ResumeBinding(),
        transition: Transition.fade
    )
  ];

}