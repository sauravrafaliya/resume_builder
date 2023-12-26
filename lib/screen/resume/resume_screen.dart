// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/resume
// *******************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:resume_builder/controller/resume_controller.dart';

import '../../core/utils/custom_text_style.dart';
import '../../model/page_model.dart';

class ResumeScreen extends GetWidget<ResumeController> {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ResponsiveBuilder(
          builder: (context,sizeInformation){
            if(sizeInformation.isDesktop){
              return _buildResumeView();
            }else{
              return Stack(
                children: [
                  _buildResumeView(),
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
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildResumeView(){
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16,),
        const Text("Resume",style: CustomTextStyle.black18_600,),
        Expanded(
          child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              children: List.generate(
                  controller.reOrderItemIndex.length, (index) => _buildListItem(controller.reOrderItemIndex[index],index))
          ),
        ),
      ],
    ));
  }

  Widget _buildListItem(int index,int realIndex){
    PageViewModel pageData = controller.getPageViewObjet(index);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pageData.pageTitle,style: CustomTextStyle.black18_600,),
          const Divider(),
          ListView.separated(
            separatorBuilder: (context,_){
              return const SizedBox(height: 5,);
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
                      return const SizedBox(height: 8,);
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
        ],
      ),
    );
  }
}
