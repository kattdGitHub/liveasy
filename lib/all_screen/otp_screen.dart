import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/profile_screen.dart';
import 'package:liveasy/auth/phone_number_cubit/phone_number_cubit.dart';
import 'package:liveasy/utils/custom_button.dart';
import 'package:liveasy/utils/notifier.dart';

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
        padding: EdgeInsets.all(16.0),
        child: Form(key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              Text(
                'Verify Phone',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Code is sent to 8094508485',
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
                      controller: _codeController,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                      ),
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.0),
              Center(
                child: GestureDetector(
                  onTap: () => _verifyPhoneNumber(context),
                  child: Text.rich(
                    TextSpan(text: "Didn't receive the code? ", children: [
                      TextSpan(
                        text: "Request Again",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              BlocConsumer<PhoneNumberCubit, PhoneNumberState>(
                listener: (context, state) {
                  if (state is VerifyNumberSuccess) {
                    context.push(ProfileScreen());
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    loading: state is VerifyPhoneScreen,
                    title: "VERIFY AND CONTINUE",
                    onPressed: () {if(fromKey.currentState?.validate()??false){
                      context.read<PhoneNumberCubit>().signInWithPhoneNumber(
                          verificationId, _codeController.text.trim());}
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
