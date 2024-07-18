import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/home_screen/home_screen.dart';
import 'package:liveasy/business_logic/phone_number_cubit/phone_number_cubit.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/custom_richtext.dart';
import 'package:liveasy/utils/custom_snackBar.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/notifier.dart';
import 'package:liveasy/utils/print_log.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneScreen extends StatelessWidget {
  final String verificationId;
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController phoneController;
  final fromKey = GlobalKey<FormState>();

  VerifyPhoneScreen(
      {Key? key, required this.phoneController, required this.verificationId})
      : super(key: key);

  void _verifyPhoneNumber(BuildContext context) {
    context
        .read<PhoneNumberCubit>()
        .verifyPhoneNumber(phoneController.text.trim(), push: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Verify Phone",
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "Code is sent to 8094508485",
                fontSize: 16.sp,
                color: Colors.black45,
              ).paddingOnly(
                bottom: 15.sp,
                top: 8.h,
              ),
              Pinput(
                length: 6,
                controller: _codeController,
                onCompleted: (value) {
                  context
                      .read<PhoneNumberCubit>()
                      .signInWithPhoneNumber(verificationId, value);
                },
              ),

              // Center(
              //   child: GestureDetector(
              //     onTap: () => _verifyPhoneNumber(context),
              //     child: Text.rich(
              //       TextSpan(text: "Didn't receive the code? ", children: [
              //         TextSpan(
              //           text: "Request Again",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 18.sp,
              //           ),
              //         )
              //       ]),
              //     ),
              //   ),
              // ),
              CustomRichText(
                onTap: () => _verifyPhoneNumber(context),
                text: "Didn't receive the code? ",
                richText: "Request Again",
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ).paddingOnly(
                bottom: 30.h,
                top: 20.h,
              ),
              BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
                listener: (context, state) {
                  printLog("state====>$state");
                  if (state is VerifyNumberSuccess) {
                    context.push(const ProfileScreen());
                  }
                  if (state is PhoneNumberError) {
                    showCustomSnackBar(context, state.error, isError: true);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    loading: state is PhoneNumberLoading,
                    title: "VERIFY AND CONTINUE",
                    onPressed: () {
                      if (fromKey.currentState?.validate() ?? false) {
                        context.read<PhoneNumberCubit>().signInWithPhoneNumber(
                            verificationId, _codeController.text.trim());
                      }
                    },
                  );
                },
              ),
            ],
          ).paddingOnly(
            top: 100.h,
          ),
        ),
      ),
    );
  }
}
