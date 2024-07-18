import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/sized_box.dart';
import 'package:provider/provider.dart'; // Import Provider package
import 'package:liveasy/all_screen/frame_screen.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';

part 'home_custom_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ProfileSelectionProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              CustomText(
                text: "Please select your profile",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ).sizedHeight(
                30.h,
              ),
              HomeCustomBox(
                title: "Shipper",
                imagePath: "assets/shop.jpeg",
                isSelected: provider.isSelected1,
                onTap: () => provider.toggleSelection1(),
              ).sizedHeight(25.h),
              HomeCustomBox(
                title: "Transport",
                imagePath: "assets/transport.jpeg",
                isSelected: provider.isSelected2,
                onTap: () => provider.toggleSelection2(),
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
          )
              .paddingSymmetric(vertical: 15.h, horizontal: 15.w)
              .sizedHeight(40.h);
        },
      ),
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
