import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.textAlign,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? Theme.of(context).textTheme.displayMedium,
      // style: TextStyle(
      //   color: color ?? AppColors.black38,
      //   fontWeight: fontWeight ?? FontWeight.normal,
      //   fontSize: fontSize,
      // ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
