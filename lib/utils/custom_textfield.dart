import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/utils/app_color.dart';
import 'package:liveasy/utils/app_config.dart';
class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  CustomTextField({
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConfig.width * 0.9,
      height: 80.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        border: Border.all(width: 1),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (hintText != null && (controller?.text.isEmpty ?? true))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                hintText!,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColor.textColor.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controller,
              obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: prefixIcon != null
                    ? Icon(prefixIcon, color: AppColor.textColor)
                    : null,
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: AppColor.textColor)
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20.h),
              ),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColor.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}