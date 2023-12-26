// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/resume
// *******************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume_builder/controller/resume_controller.dart';
import 'package:resume_builder/core/const/app_theme.dart';
import 'package:resume_builder/model/page_model.dart';
import 'package:resume_builder/route/router_config.dart';
import 'package:resume_builder/screen/resume/resume_screen.dart';
import 'package:resume_builder/widget/custom_button_widget.dart';

import '../../core/utils/custom_text_style.dart';

class ResumePreviewScreen extends StatelessWidget {
  ResumePreviewScreen({super.key});

  final controller = Get.find<ResumeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ResponsiveBuilder(
              builder: (context,sizeInformation){
                if(sizeInformation.isDesktop){
                  return _buildDeskTopView(context);
                }else{
                  return _buildMobileView(context);
                }
              },
            ),
            Positioned(
                top: 15,
                left: 15,
                child: IconButton.filled(
                  onPressed: (){
                    Get.back();
                  },
                  icon: const Icon(CupertinoIcons.back),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDeskTopView(BuildContext context){
    double boxWidth = context.width*0.5;
    return Row(
      children: [
        Container(
          color: AppTheme.blueColor,
          width: boxWidth,
          height: context.height,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(36),
            child: _buildResumePreviewView(),
          ),
        ),
        Container(
          color: AppTheme.primaryColor,
          width: boxWidth,
          height: context.height,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(36),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
                child: const ResumeScreen()),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView(BuildContext context){
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: _buildResumePreviewView(),
            ),
            const SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomButtonWidget(
                  onTap: (){
                    Get.toNamed(AppRoute.resumeScreen);
                  },
                label: "Preview",
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResumePreviewView(){
    return Obx(()=>ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ReorderableListView(
        physics: const BouncingScrollPhysics(),
        buildDefaultDragHandles: false,
        padding: const EdgeInsets.all(16),
        onReorder: controller.reorderPosition,
        proxyDecorator: (child,index,value){
          return AnimatedBuilder(
            animation: value,
            builder: (context,child) {
              return Material(child: _buildListItem(controller.reOrderItemIndex[index],index));
            },
            child: child,
          );
        },
        children: List.generate(
            controller.reOrderItemIndex.length, (index) => Padding(
          key: ValueKey('$index'),
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: _buildListItem(controller.reOrderItemIndex[index],index),
        ))
      ),
    ));
  }

  Widget _buildListItem(int index,int realIndex){
    PageViewModel pageData = controller.getPageViewObjet(index);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(pageData.pageTitle,style: CustomTextStyle.black18_600,)),
                ReorderableDragStartListener(
                  index: realIndex,
                  child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.drag_indicator),
                  ),
                )
              ],
            ),
            const Divider(),
            ListView.separated(
              separatorBuilder: (context,_){
                return const SizedBox(height: 12,);
              },
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: pageData.section.length,
              itemBuilder: (context,sectionIndex){
                bool isSectionTitle = pageData.section[sectionIndex].sectionTitle.isNotEmpty;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: isSectionTitle,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0,left: 0,right: 0),
                        child: Text("${pageData.section[sectionIndex].sectionTitle} :",style: CustomTextStyle.black16_600,),
                      ),
                    ),
                    ListView.separated(
                      separatorBuilder: (context,_){
                        return const SizedBox(height: 12,);
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      padding: isSectionTitle ? const EdgeInsets.only(left: 12) : EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: pageData.section[sectionIndex].fields.length,
                      itemBuilder: (context,fieldIndex){
                        Field field = pageData.section[sectionIndex].fields[fieldIndex];
                        return RichText(
                            text: TextSpan(
                              style: CustomTextStyle.black14_600,
                              text: "${field.title??""} : ",
                              children: [
                                TextSpan(
                                  text: field.controller?.text,
                                  style: CustomTextStyle.grey14_500
                                )
                              ]
                            )
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 6,),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  controller.navigatePageAtIndex(index);
                  Get.back();
                },
                child: Text("Edit",
                  style: CustomTextStyle.black16_600.copyWith(color: AppTheme.primaryColor,decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

