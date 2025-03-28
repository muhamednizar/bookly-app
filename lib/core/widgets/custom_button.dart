import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    this.borderRadius,
    required this.textColor,
    required this.buttonText,
    this.fontSize,
  });

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String buttonText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15),
              )),
          child: Text(
            buttonText,
            style: Styles.textStyle18.copyWith(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}
