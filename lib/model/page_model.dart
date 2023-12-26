// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/model
// *******************************

// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

PageViewModel pageFromJson(String str) => PageViewModel.fromJson(json.decode(str));

String pageToJson(PageViewModel data) => json.encode(data.toJson());

class PageViewModel {
  String pageTitle;
  String pageDescription;
  List<Section> section;

  PageViewModel({
    this.pageTitle = "",
    this.pageDescription = "",
    this.section = const [],
  });

  PageViewModel copyWith({
    String? pageTitle,
    String? pageDescription,
    List<Section>? section,
  }) =>
      PageViewModel(
        pageTitle: pageTitle ?? this.pageTitle,
        pageDescription: pageDescription ?? this.pageDescription,
        section: section ?? this.section,
      );

  factory PageViewModel.fromJson(Map<String, dynamic> json) => PageViewModel(
    pageTitle: json["page_title"]??"",
    pageDescription: json["page_description"]??"",
    section: json["section"] == null ? [] : List<Section>.from(json["section"]!.map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page_title": pageTitle,
    "page_description": pageDescription,
    "section": List<dynamic>.from(section.map((x) => x.toJson())),
  };
}

class Section {
  String sectionTitle;
  bool isRequired;
  bool isHorizontal;
  bool isAddable;
  List<Field> fields;

  Section({
    this.sectionTitle = "",
    this.isRequired = false,
    this.isHorizontal = false,
    this.isAddable = false,
    this.fields = const [],
  });

  Section copyWith({
    String? sectionTitle,
    bool? isRequired,
    bool? isHorizontal,
    bool? isAddable,
    List<Field>? fields,
  }) =>
      Section(
        sectionTitle: sectionTitle ?? this.sectionTitle,
        isRequired: isRequired ?? this.isRequired,
        isHorizontal: isHorizontal ?? this.isHorizontal,
        fields: fields ?? this.fields,
        isAddable: isAddable ?? this.isAddable,
      );

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    sectionTitle: json["section_title"]??"",
    isRequired: json["is_required"]??false,
    isHorizontal: json["is_horizontal"]??false,
    isAddable: json["is_addable"]??false,
    fields: json["fields"] == null ? [] : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "section_title": sectionTitle,
    "is_required": isRequired,
    "is_addable": isAddable,
    "is_horizontal": isHorizontal,
    "fields": List<dynamic>.from(fields.map((x) => x.toJson())),
  };
}

class Field {
  TextInputType? type;
  String? title;
  String? placeholder;
  String? instructionText;
  TextEditingController? controller;
  int? maxLine;
  bool isAddable;

  Field({
    this.type,
    this.title,
    this.placeholder,
    this.instructionText,
    this.controller,
    this.maxLine,
    this.isAddable = false
  });

  Field copyWith({
    TextInputType? type,
    String? title,
    String? placeholder,
    String? instructionText,
    TextEditingController? controller,
    int? maxLine,
    bool? isAddable
  }) =>
      Field(
        type: type ?? this.type,
        title: title ?? this.title,
        placeholder: placeholder ?? this.placeholder,
        instructionText: instructionText ?? this.instructionText,
        controller: controller ?? this.controller,
        maxLine: maxLine ?? this.maxLine,
        isAddable: isAddable ?? this.isAddable
      );

  factory Field.fromJson(Map<String, dynamic> json) => Field(
    type: json["type"],
    title: json["title"],
    placeholder: json["placeholder"],
    instructionText: json["instruction_text"],
    maxLine: json["max_line"],
    isAddable: json["is_addable"]??false,
    controller: TextEditingController(text: json["controller"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "placeholder": placeholder,
    "instruction_text": instructionText,
    "controller": controller?.text,
    "is_addable": isAddable,
    "max_line" : maxLine
  };
}
