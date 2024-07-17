import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/mobile_verifition.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';

class FrameScreen extends StatelessWidget {
  const FrameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Icon(
                Icons.image_outlined,
                size: 100.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Please select your language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "You can change the language \nat any time",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomButton(
                title: "Next",
                onPressed: () {
                  context.push(MobileNumberScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
