import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/utils/app_color.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  CustomText(
      {super.key,
      required this.text,
      this.style,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ) ??
          TextStyle(
            fontSize: fontSize ?? 16.sp,
            color: color ?? AppColor.textColor,
            fontWeight: fontWeight ?? FontWeight.w400,
          ),
      textAlign: TextAlign.center,
    );
  }
}