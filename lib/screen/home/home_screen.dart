// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/home
// *******************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume_builder/controller/resume_controller.dart';
import 'package:resume_builder/core/const/app_theme.dart';
import 'package:resume_builder/core/const/const_string.dart';
import 'package:resume_builder/core/utils/custom_text_style.dart';
import 'package:resume_builder/screen/form/resume_form_screen.dart';

class HomeScreen extends GetWidget<ResumeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
      child: ResponsiveBuilder(
        builder: (context,sizeInformation){
          if(sizeInformation.isDesktop){
            return Align(
              alignment: Alignment.center,
                child: _buildDeskTopView(context),
            );
          }else{
            return _buildMobileView(context);
          }
        },
      ),
    );
  }

  Widget _buildDeskTopView(BuildContext context){
    return Scaffold(
      backgroundColor: AppTheme.blueColor,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.white,
            height: context.height*0.9,
            width: 800,
            child: _buildPageView(controller.pageController.value,true),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileView(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: context.height,
          width: context.width,
          child: _buildPageView(controller.pageController.value),
        ),
      ),
    );
  }

  Widget _buildPageView(PageController pageController,[bool isDesktop = false]){
    return ClipRRect(
      borderRadius: isDesktop ? BorderRadius.circular(30) : BorderRadius.zero,
      child: Obx(()=>Stack(
        children: [
          PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.pageViewList.length,
              onPageChanged: (value){
                controller.pageIndexValue = value;
              },
              itemBuilder: (context,index){
                return ResumeFormView(pageViewModel: controller.pageViewList[index],);
              }
          ),
          Positioned(
            bottom: 30,
            right: 25,
            child: AnimatedSwitcher(
              switchInCurve: Curves.bounceIn,
              switchOutCurve: Curves.bounceOut,
              duration: const Duration(milliseconds: 200),
              child: controller.isCompleteButton ? IconButton.filled(
                onPressed: (){
                  controller.nextPage();
                },
                icon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(complete,style: CustomTextStyle.white14_600),
                ),
              ) : IconButton.filled(
                    onPressed: (){
                      controller.nextPage();
                    },
                    icon: const Icon(CupertinoIcons.forward),
              ),
            ),
          ),
          Visibility(
            visible: controller.isShowPreviousButton,
            child: Positioned(
                bottom: 30,
                left: 25,
                child: IconButton.filled(
                  onPressed: (){
                    controller.previousPage();
                  },
                  icon: const Icon(CupertinoIcons.back),
                )
            ),
          )
        ],
      )),
    );
  }
}
