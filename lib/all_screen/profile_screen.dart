import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:liveasy/all_screen/frame_screen.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProfileSelectionProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              SizedBox(height: 40.h),
              Text(
                "Please select your profile",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
              ),
              SizedBox(height: 30.h),
              buildProfileSelection(
                context,
                "Shipper",
                "assets/shop.jpeg",
                provider.isSelected1,
                    () => provider.toggleSelection1(),
              ),
              SizedBox(height: 25.h),
              buildProfileSelection(
                context,
                "Transport",
                "assets/transport.jpeg",
                provider.isSelected2,
                    () => provider.toggleSelection2(),
              ),
              SizedBox(height: 40.h),
              CustomButton(
                title: "CONTINUE",
                onPressed: () {
                  if (provider.isSelected1 && provider.isSelected2) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => FrameScreen()),
                          (route) => false,
                    );
                  }
                },
              ),
            ],
          ).paddingSymmetric(vertical: 15.h, horizontal: 15.w);
        },
      ),
    );
  }

  Widget buildProfileSelection(
      BuildContext context,
      String title,
      String imagePath,
      bool isSelected,
      VoidCallback onTap,
      ) {
    return Container(
      height: 90.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
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
              color: isSelected ? Colors.blue : Colors.transparent, // Highlight selected
            ),
          ),
          Image(image: AssetImage(imagePath)).paddingSymmetric(horizontal: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
              ),
              Text(
                'Lorem ipsum dolor sit amet, \nconsectetur adipiscing',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Color(0xff6A6C7B),
                ),
              ),
            ],
          )
        ],
      ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
    );
  }
}

class ProfileSelectionProvider with ChangeNotifier {
  bool _isSelected1 = false;
  bool _isSelected2 = false;

  bool get isSelected1 => _isSelected1;
  bool get isSelected2 => _isSelected2;

  void toggleSelection1() {
    _isSelected1 = !_isSelected1;
    notifyListeners();
  }

  void toggleSelection2() {
    _isSelected2 = !_isSelected2;
    notifyListeners();
  }
}
