import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/gestures.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color richTextColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String? richText;
  final VoidCallback? onTap;
  final VoidCallback? richonTap;

  CustomRichText({
    Key? key,
    this.text = "",
    this.fontSize = 16,
    this.richTextColor = Colors.green,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    this.richText,
    this.onTap,
    this.richonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        recognizer: TapGestureRecognizer()..onTap = onTap,
        children: <TextSpan>[
          TextSpan(
            text: richText,
            style: TextStyle(
              fontFamily: 'Satoshi',
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              height: 1.35,
              // Adjust as necessary
              color: richTextColor,
            ),

            recognizer: TapGestureRecognizer()
              ..onTap = richonTap, // Handle sign in tap
          ),
        ],
      ),
    );
  }
}