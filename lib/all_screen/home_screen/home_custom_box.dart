import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/padding_custom.dart';

class HomeCustomBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;
  final bool isSelected;

  const HomeCustomBox({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isSelected ? Colors.white : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black),
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
            Image(
              image: AssetImage(imagePath),
              height: 50.h,
              width: 50.w,
            ).paddingSymmetric(horizontal: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                  ),
                ),
                CustomText(
                  text: 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
