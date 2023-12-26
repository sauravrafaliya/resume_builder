// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/form/widget
// *******************************

import 'package:flutter/material.dart';
import 'package:resume_builder/model/page_model.dart';

class TextFieldWidget extends StatelessWidget {
  final Field? field;

  const TextFieldWidget({super.key,this.field});

  @override
  Widget build(BuildContext context) {
    Field fieldData = field??Field();
    return TextField(
      controller: fieldData.controller,
      keyboardType: fieldData.type,
      decoration: InputDecoration(
        helperText: fieldData.instructionText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        alignLabelWithHint: true,
        labelText: fieldData.placeholder,
      ),
      maxLines: fieldData.maxLine,
      minLines: fieldData.maxLine,
    );
  }
}
