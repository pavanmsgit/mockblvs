import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/app_images.dart';
import 'package:jiffy_fuels/const/screen_size.dart';


class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.white,
      radius: ScreenSize.width(context) * 0.18,
      child: Center(
        child: Image.asset(
          AppImages.appLogo,
          height: ScreenSize.height(context) * 0.08,
        ),
      ),
    );
  }
}

class JiffyButton extends StatelessWidget {
  JiffyButton(
      {Key? key,
      required this.buttonText,
      required this.onTap,
      this.width,
      this.buttonColor,
      this.textColor,
      this.isRounded})
      : super(key: key);
  final String buttonText;
  final Function() onTap;
  final Color? buttonColor, textColor;
  bool? isRounded = false;
  double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(width ?? 0.0, ScreenSize.height(context) * 0.06),
        ),
        // maximumSize: MaterialStateProperty.all(
        //   Size(0, ScreenSize.height(context) * 0.06),
        // ),
        backgroundColor:
            MaterialStateProperty.all(buttonColor ?? AppColor.primaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: isRounded != null
                  ? isRounded!
                      ? BorderRadius.circular(10.0)
                      : BorderRadius.circular(3.0)
                  : BorderRadius.circular(3.0)),
        ),
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class CancelJiffyButton extends StatelessWidget {
  const CancelJiffyButton({Key? key, this.onTap}) : super(key: key);

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: const AutoSizeText(
          "Cancel",
          minFontSize: 18.0,
          maxFontSize: 32.0,
          style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: AppColor.darkGreyShade,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.imageUrl = '',
    this.image,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final File? image;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: GestureDetector(
              onTap: onTap,
              child: imageUrl!.isNotEmpty && image == null
                  ? CachedNetworkImage(
                      imageUrl: imageUrl!,
                      height: ScreenSize.height(context) * 0.1,
                    )
                  : image == null
                      ? Icon(
                          Icons.photo_library_outlined,
                          size: ScreenSize.height(context) * 0.1,
                        )
                      : Image.file(
                          image!,
                          height: ScreenSize.height(context) * 0.1,
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTimeButton extends StatelessWidget {
  const SelectTimeButton({
    Key? key,
    required this.title,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  final String title, time;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 40,
                width: ScreenSize.width(context) * 0.3,
                color: Colors.grey.withOpacity(0.3),
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.grey.withOpacity(0.7),
                  child: Center(
                    child: Icon(
                      Icons.access_time,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OpenCloseTime extends StatelessWidget {
  const OpenCloseTime({
    Key? key,
    required this.onOpen,
    required this.onClose,
    this.openTime = '00:00',
    this.closeTime = '00:00',
  }) : super(key: key);
  final String openTime, closeTime;
  final Function() onOpen, onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SelectTimeButton(
            title: 'Open Time',
            time: openTime,
            onTap: onOpen,
          ),
          SelectTimeButton(
            title: 'Close Time',
            time: closeTime,
            onTap: onClose,
          ),
        ],
      ),
    );
  }
}
