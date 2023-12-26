import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume_builder/binding/initial_binding.dart';
import 'package:resume_builder/core/const/app_theme.dart';
import 'package:resume_builder/route/router_config.dart';

import 'core/utils/app_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context) {
        return GetMaterialApp(
          scrollBehavior: AppScrollBehavior(),
          title: 'Resume Builder',
          initialRoute: AppRoute.starterScreen,
          getPages: AppRoute.pages,
          initialBinding: InitialBinding(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: AppTheme.poppins,
            inputDecorationTheme: const InputDecorationTheme(
              labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.grey)
            ),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppTheme.primaryColor,
              primary: AppTheme.primaryColor,
              secondary: AppTheme.blueColor
            ),
            useMaterial3: true,
          ),
        );
      }
    );
  }
}

