import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liveasy/all_screen/frame_screen.dart';
import 'package:liveasy/all_screen/otp_screen.dart';
import 'package:liveasy/all_screen/profile_screen.dart';
import 'package:liveasy/auth/phone_number_cubit/phone_number_cubit.dart';
import 'package:liveasy/business_logic/provider_all%20/dashboard_provider.dart';
import 'package:liveasy/firebase_options.dart';
import 'package:liveasy/utils/app_config.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => PhoneNumberCubit(),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfileSelectionProvider>(
                  create: (_) => ProfileSelectionProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Liveasy',
              home: FrameScreen(),
            ),
          ),
        );
      },
    );
  }
}
