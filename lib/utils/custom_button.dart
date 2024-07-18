import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Widget? child;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color color;
  final double width;
  final bool loading;
  final double height;

  CustomButton({
    Key? key,
    required this.title,
    this.child,
    required this.onPressed,
    this.borderRadius = 8.0,
    this.color = const Color(0xff2E3B62),
    this.width = double.infinity,
    this.height = 60,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : child ??
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
      ),
    );
  }
}
