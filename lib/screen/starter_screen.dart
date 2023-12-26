// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen
// *******************************

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume_builder/core/const/app_theme.dart';
import 'package:resume_builder/core/const/assets_path.dart';
import 'package:resume_builder/core/utils/custom_text_style.dart';
import 'package:resume_builder/route/router_config.dart';
import 'package:resume_builder/widget/custom_button_widget.dart';

import '../core/const/const_string.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppTheme.blueColor,
        systemNavigationBarColor: AppTheme.blueColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: ResponsiveBuilder(
              builder: (context,sizingInformation) {
                if(sizingInformation.isDesktop){
                  return _buildDesktopView(context);
                }else{
                  return _buildMobileView(context);
                }
              }
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context){
    return Container(
      color: AppTheme.blueColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            SvgPicture.asset(
              AssetsPath.astImgStarterVectorSvg,
            ),
            const SizedBox(height: 20,),
            const Text(starterSlogan,
              style: CustomTextStyle.white20_600,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CustomButtonWidget(
              label: letStart,
              width: context.width,
              onTap: (){
                Get.offAndToNamed(AppRoute.homeScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopView(BuildContext context){
    return Row(
      children: [
        Container(
          color: AppTheme.blueColor,
          width: context.width*0.5,
          height: context.height,
          child: Center(
            child: SvgPicture.asset(
              AssetsPath.astImgStarterVectorSvg,
            ),
          ),
        ),
        Container(
          width: context.width*0.5,
          height: context.height,
          color: AppTheme.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(starterSlogan,
                style: CustomTextStyle.white20_600,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50,),
              CustomButtonWidget(
                label: letStart,
                width: context.width,
                bgColor: AppTheme.blueColor,
                onTap: (){
                  Get.offAndToNamed(AppRoute.homeScreen);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
