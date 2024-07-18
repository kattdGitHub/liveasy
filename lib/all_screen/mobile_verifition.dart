import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/otp_screen.dart';
import 'package:liveasy/business_logic/phone_number_cubit/phone_number_cubit.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/custom_snackBar.dart';
import 'package:liveasy/utils/custom_text.dart';
import 'package:liveasy/utils/notifier.dart';
import 'package:liveasy/utils/sized_box.dart';

class MobileNumberScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  MobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                CustomText(
                  text: "Please enter your mobile number",
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: "You'll receive a 6 digit code \nto verify next.",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/india.png',
                            width: 30,
                          ),
                          CustomText(
                            text: "+91",
                            fontSize: 16.sp,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(
                  bottom: 30.h,
                  top: 10.h,
                ),
                BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
                  listener: (context, state) {
                    if (state is PhoneNumberSuccess) {
                      showCustomSnackBar(context, "Otp send successfully");
                      context.push(
                        VerifyPhoneScreen(
                          phoneController: phoneController,
                          verificationId: state.verificationId,
                        ),
                      );
                    }
                    if (state is PhoneNumberError) {
                      showCustomSnackBar(context, state.error, isError: true);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      loading: state is PhoneNumberLoading,
                      title: "Continue",
                      onPressed: () {
                        if (fromKey.currentState?.validate() ?? false) {
                          context
                              .read<PhoneNumberCubit>()
                              .verifyPhoneNumber(phoneController.text.trim());
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
