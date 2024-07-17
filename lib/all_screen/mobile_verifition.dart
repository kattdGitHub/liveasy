import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/otp_screen.dart';
import 'package:liveasy/auth/phone_number_cubit/phone_number_cubit.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';

class MobileNumberScreen extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

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
              SizedBox(
                height: 100.h,
              ),
              Text(
                "Please enter your mobile number",
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(height: 10),
              Text(
                "You'll receive a 6 digit code \nto verify next.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 30),
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
                        SizedBox(width: 5),
                        Text(
                          '+91',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
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
              ),
              SizedBox(
                height: 30.h,
              ),
              BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
                listener: (context, state) {
                  if (state is PhoneNumberSuccess) {
                    context.push(
                      VerifyPhoneScreen(
                        phoneController: phoneController,
                        verificationId: state.verificationId,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    loading: state is MobileNumberScreen,
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
    );
  }
}
