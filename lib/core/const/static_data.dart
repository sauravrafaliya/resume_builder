// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/core/const
// *******************************


import 'package:flutter/cupertino.dart';

import '../../model/page_model.dart';

final pageTitleList = [
  "Personal Information",
  "About me",
  "Education",
  "Work and Related Experience",
  "Skills",
  "Hobbies"
];

List<PageViewModel> pagesList = [
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
              instructionText: "Ex. +91 00000 00000",
              placeholder: "Enter your contact number",
              title: "Contact Number",
              type: const TextInputType.numberWithOptions()
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
      pageDescription: "The \"About Me\" section of your resume is a great opportunity to showcase your personality and strengths beyond just your skills and experience. It's where you can make a genuine connection with the hiring manager and give them a sense of who you are as a person.",
      section: [
        Section(
          fields:[
            Field(
              controller: TextEditingController(),
              instructionText: "Ex. I am a highly motivated and results-oriented individual with a strong work ethic...",
              placeholder: "Describe yourself...",
              title: "About Me",
            ),
          ]
        )
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
  )

];