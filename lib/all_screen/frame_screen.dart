import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/mobile_verifition.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/notifier.dart';
import 'package:liveasy/utils/sized_box.dart';

class FrameScreen extends StatelessWidget {
  const FrameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.image_outlined,
              size: 100.w,
            ).sizedHeight(
              20.h,
            ),
            CustomText(
              text: "Please select your language",
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              textAlign: TextAlign.center,
            ).sizedHeight(
              10.h,
            ),
            CustomText(
              text: "You can change the language \nat any time",
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ).sizedHeight(
              10.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    CustomText(
                      text: "English",
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ).paddingSymmetric(
                  horizontal: 10.w,
                ),
              ),
            ).paddingOnly(bottom: 50.h),
            CustomButton(
              title: "Next",
              onPressed: () {
                context.push(MobileNumberScreen());
              },
            )
          ],
        )
            .paddingSymmetric(
              horizontal: 20.w,
            )
            .sizedHeight(
              100.h,
            ),
      ),
    );
  }
}
