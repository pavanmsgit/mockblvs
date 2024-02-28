import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockblvs/consts/app_colors.dart';
import 'package:mockblvs/controllers/home_page_controller.dart';
import 'package:mockblvs/firebase_options.dart';
import 'package:mockblvs/views/splashScreen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GetStorage.init();

  Get.put(HomePageController());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColor.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        themeMode: ThemeMode.dark,
        navigatorKey: Get.key,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        // home: const RegisterScreen(),
      );
    });
  }
}
