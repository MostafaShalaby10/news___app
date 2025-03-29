import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/Utils/service_locator.dart';
import 'package:news_app/features/home/view/home_view.dart';
import 'package:news_app/features/login/view/login_view.dart';
import 'package:news_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setup();
  runApp(
    DevicePreview(builder: (context) => const MyApp(), enabled: !kReleaseMode),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter News app',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.blue,
          ),
          home: const HomeView(),
        );
      },
    );
  }
}
