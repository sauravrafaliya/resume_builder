// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/screen/form/widget
// *******************************

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: context.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Select Date",style: Theme.of(context).inputDecorationTheme.labelStyle),
            const Icon(Icons.date_range,color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
