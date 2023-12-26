// *******************************
// Develop by : Saurav Rafaliya
// Path : lib/widget
// *******************************

import 'package:flutter/material.dart';

import '../core/const/app_theme.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String label;
  final bool isLoading;
  final double? width;
  final Color? bgColor;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    this.label = "",
    this.isLoading = false,
    this.width,
    this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 45,
        minHeight: 45,
        maxWidth: 330
      ),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(bgColor??AppTheme.primaryColor),
              surfaceTintColor: MaterialStateProperty.all(bgColor??AppTheme.primaryColor)
            ),
            child: isLoading ? const SizedBox(
                width: 30, height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                ),
            ) : Text(label)
        ),
      ),
    );
  }
}
