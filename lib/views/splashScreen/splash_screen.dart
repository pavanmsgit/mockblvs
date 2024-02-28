import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mockblvs/consts/app_Strings.dart';
import 'package:mockblvs/consts/app_images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    phoneAuthController.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue. shade700,
                Colors.blue.shade800
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.applicationLogo,
                width: 20.w,
                height: 20.h,
              ),
              SizedBox(height: 3.h),
              Center(
                  child: AutoSizeText(
                    AppString.titleEng.toUpperCase(),
                    minFontSize: 20,
                    maxFontSize: 32,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  )),
            ],
          )),
    );
  }
}
