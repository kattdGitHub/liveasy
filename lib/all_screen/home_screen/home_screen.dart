import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/frame_screen.dart';
import 'package:liveasy/utils/custom_snackBar.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/sized_box.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';
import 'home_custom_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedProfile = '';

  void selectProfile(String profile) {
    setState(() {
      selectedProfile = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(
              text: "Please select your profile",
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            SizedBox(
              height: 20.h,
            ),
            HomeCustomBox(
              title: "Shipper",
              imagePath: "assets/shop.jpeg",
              isSelected: selectedProfile == "Shipper",
              onTap: () {
                selectProfile("Shipper");
              },
            ),
            SizedBox(height: 30.h),
            HomeCustomBox(
              title: "Transport",
              imagePath: "assets/transport.jpeg",
              isSelected: selectedProfile == "Transport",
              onTap: () {
                selectProfile("Transport");
              },
            ),
            SizedBox(height: 40.h),
            CustomButton(
              title: "CONTINUE",
              onPressed: () {
                if (selectedProfile.isNotEmpty) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => FrameScreen()),
                        (Route<dynamic> route) => false,
                  );
                } else {
                  showCustomSnackBar(context, "Please select a profile");
                }
              },
            ),
          ],
        ).paddingSymmetric(
          horizontal: 15.w,
        ),
      ),
    );
  }
}
