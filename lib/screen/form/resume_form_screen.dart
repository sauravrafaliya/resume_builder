// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/form
// *******************************

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder/controller/resume_controller.dart';
import 'package:resume_builder/core/const/app_theme.dart';
import 'package:resume_builder/core/utils/custom_text_style.dart';
import 'package:resume_builder/model/page_model.dart';
import 'package:resume_builder/screen/form/widget/text_field_widget.dart';

class ResumeFormView extends StatelessWidget {
  final String pageTitle;
  final PageViewModel? pageViewModel;
  const ResumeFormView({super.key,this.pageTitle = "",this.pageViewModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResumeController>();
    PageViewModel pageData = pageViewModel??PageViewModel();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(pageData.pageTitle,style: CustomTextStyle.black20_600),
          const SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                children: [
                  Visibility(
                    visible: pageData.pageDescription.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0,left: 12,right: 12),
                      child: Text(pageData.pageDescription,style: CustomTextStyle.black38_12_600,),
                    ),
                  ),
                  ListView.separated(
                    separatorBuilder: (context,_){
                      return const SizedBox(height: 24,);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: pageData.section.length,
                    itemBuilder: (context,sectionIndex){
                      return  Column(
                        children: [
                          Visibility(
                            visible: pageData.section[sectionIndex].isAddable,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 24.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Visibility(
                                        replacement: const SizedBox(),
                                        visible: pageData.section[sectionIndex].sectionTitle.isNotEmpty,
                                        child: Text("${pageData.section[sectionIndex].sectionTitle} ${sectionIndex+1}",style: CustomTextStyle.black20_600,),
                                      )
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton.filled(
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(AppTheme.blueColor)
                                      ),
                                      onPressed: (){
                                        if(sectionIndex == 0){
                                          controller.addSection();
                                        }else{
                                          controller.removeSection(sectionIndex);
                                        }
                                      },
                                      icon: Icon(sectionIndex == 0 ? Icons.add : Icons.delete_outline)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListView.separated(
                            separatorBuilder: (context,_){
                              return const SizedBox(height: 24,);
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: pageData.section[sectionIndex].fields.length,
                            itemBuilder: (context,fieldIndex){
                              Field field = pageData.section[sectionIndex].fields[fieldIndex];
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      field: field,
                                    ),
                                  ),
                                  Visibility(
                                    visible: field.isAddable,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0,left: 24),
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: IconButton.filled(
                                            style: ButtonStyle(
                                                backgroundColor: MaterialStateProperty.all(AppTheme.blueColor)
                                            ),
                                            onPressed: (){
                                              if(fieldIndex == 0){
                                                controller.addField(sectionIndex, fieldIndex);
                                              }else{
                                                controller.removeFieldSection(sectionIndex, fieldIndex);
                                              }
                                            },
                                            icon: Icon(fieldIndex == 0 ? Icons.add : Icons.delete_outline)
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
