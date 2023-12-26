// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/controller
// *******************************

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:resume_builder/core/utils/helper_fun.dart';
import 'package:resume_builder/route/router_config.dart';

import '../model/page_model.dart';

class ResumeController extends GetxController{

  final pageController = PageController(initialPage: 0).obs;

  final reOrderItemIndex = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    if(reOrderItemIndex.isEmpty){
      reOrderItemIndex.value = List.generate(pageViewList.length, (index) => index);
    }
  }

  final pageViewList = <PageViewModel>[
    PageViewModel(
        pageTitle: "Personal Information",
        section: [
          Section(
              fields: [
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. John Doe",
                  placeholder: "Enter your full name",
                  title: "Full Name",
                ),
                Field(
                    controller: TextEditingController(),
                    instructionText: "Ex. 66666 55555",
                    placeholder: "Enter your contact number",
                    title: "Contact Number",
                    type: TextInputType.number
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. john.doe@email.com",
                  placeholder: "Enter your email",
                  title: "Email",
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. 123 Main Street, City, State, Pincode",
                  placeholder: "Enter your address",
                  title: "Address",
                ),
              ]
          )
        ]
    ),
    PageViewModel(
        pageTitle: "About Me",
        pageDescription: "*The \"About Me\" section of your resume is a great opportunity to showcase your personality and strengths beyond just your skills and experience. It's where you can make a genuine connection with the hiring manager and give them a sense of who you are as a person.*",
        section: [
          Section(
              fields:[
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. I am a highly motivated and results-oriented individual with a strong work ethic...",
                  placeholder: "Describe yourself...",
                  title: "About Me",
                  maxLine: 5
                ),
              ]
          ),
        ]
    ),
    PageViewModel(
        pageTitle: "Education",
        pageDescription: "",
        section: [
          Section(
              fields: [
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. Bachelor of Science in Computer Science",
                  placeholder: "Enter your degree",
                  title: "Degree",
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. XYZ University/collage",
                  placeholder: "Enter your university/collage",
                  title: "University/Collage",
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. 2020",
                  placeholder: "Enter your graduation year",
                  title: "Graduation Year",
                ),
              ]
          )
        ]
    ),
    PageViewModel(
        pageTitle: "Work Experience",
        pageDescription: "",
        section: [
          Section(
            isAddable: true,
              isRequired: true,
              sectionTitle: "Experience",
              fields: [
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. Software Developer",
                  placeholder: "Enter your job title",
                  title: "Job Title",
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. ABC Tech Solutions",
                  placeholder: "Enter your company",
                  title: "Company",
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. January 2021 - Present",
                  placeholder: "Enter your duration",
                  title: "Duration",
                ),
              ]
          )
        ]
    ),
    PageViewModel(
        pageTitle: "Skills",
        pageDescription: "",
        section: [
          Section(
            isRequired: true,
              fields: [
                Field(
                  controller: TextEditingController(),
                  instructionText: "List programming languages, software, and tools you are proficient in (e.g., Java, Python, SQL, etc.).",
                  placeholder: "Enter your technical skills",
                  title: "Technical Skills",
                  maxLine: 2
                ),
                Field(
                  controller: TextEditingController(),
                  instructionText: "Ex. Communication, teamwork, problem-solving, etc.",
                  placeholder: "Enter your soft skills",
                  title: "Soft Skills",
                  maxLine: 2
                ),
              ]
          )
        ]
    ),
    PageViewModel(
        pageTitle: "Hobbies",
        pageDescription: "",
        section: [
          Section(
            isRequired: true,
            fields: [
              Field(
                maxLine: 2,
                controller: TextEditingController(),
                instructionText: "Ex. Reading,Traveling...",
                placeholder: "Enter your Hobby",
                title: "Hobbies",
              ),
            ]
          )
        ]
    )
  ].obs;

  final _pageIndex = 0.obs;

  set pageIndexValue(int value){
    _pageIndex.value = value;
    _pageIndex.refresh();
  }

  int get pageIndexValue{
    return _pageIndex.value;
  }

  bool get isShowPreviousButton{
    return _pageIndex.value > 0;
  }

  bool get isShowNextButton{
    return _pageIndex.value != pageViewList.length - 1;
  }

  bool get isCompleteButton{
    return _pageIndex.value == pageViewList.length - 1;
  }

  void addSection(){
    List<Field> newFields = [];
    Section section = pageViewList[_pageIndex.value].section.last;
    bool isFilled = section.fields.where((element) => element.controller?.text.isEmpty??false).toList().isEmpty;
    if(!isFilled)return;
    for (var element in section.fields) {
      newFields.add(element.copyWith(controller: TextEditingController()));
    }
    section = section.copyWith(
      fields: newFields
    );
    pageViewList[_pageIndex.value].section.add(section);
    pageViewList.refresh();
  }

  void removeSection(int index){
    pageViewList[_pageIndex.value].section.removeAt(index);
    pageViewList.refresh();
  }

  void addField(int sectionIndex,int fieldIndex){
    Field field = pageViewList[_pageIndex.value].section[sectionIndex].fields[fieldIndex];
    bool isFilled = field.controller?.text.isNotEmpty??false;
    if(!isFilled)return;
    pageViewList[_pageIndex.value].section[sectionIndex].fields.add(field.copyWith(
      controller: TextEditingController()
    ));
    pageViewList.refresh();
  }

  void removeFieldSection(int sectionIndex,int fieldIndex){
    pageViewList[_pageIndex.value].section[sectionIndex].fields.removeAt(fieldIndex);
    pageViewList.refresh();
  }

  void navigatePageAtIndex(int index){
    pageController.value.animateToPage(
        index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear
    );
  }

  void nextPage(){
    if(!isCompleteButton){
      bool isFillValue = true;
      String message = "";
      for (var element in pageViewList[_pageIndex.value].section) {
        bool sectionFieldIsBlank = false;
        for (var field in element.fields) {
          if(field.controller?.text.isEmpty??true){
            sectionFieldIsBlank = true;
            message = "Please enter ${field.title?.toLowerCase()}";
            break;
          }
        }
        if(sectionFieldIsBlank){
          isFillValue = false;
          break;
        }
      }
      if(isFillValue){
        pageController.value.animateToPage(
            _pageIndex.value+1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear
        );
      }else{
        HelperFun.buildSnackBar(message);
      }
    }else{
      Get.toNamed(AppRoute.resumePreviewScreen);
    }
  }

  void previousPage(){
    int index = _pageIndex.value;
    if((index - 1) != -1){
      pageController.value.animateToPage(
          _pageIndex.value-1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear
      );
    }
  }

  void reorderPosition(int oldIndex,int newIndex){
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final int item = reOrderItemIndex.removeAt(oldIndex);
    reOrderItemIndex.insert(newIndex, item);
    reOrderItemIndex.refresh();
  }

  PageViewModel getPageViewObjet(int index){
    return pageViewList[index];
  }

}

// flutter run -d web-server --web-port 8080 --web-hostname 192.168.1.11