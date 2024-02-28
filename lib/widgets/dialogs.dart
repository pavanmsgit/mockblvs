import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/asset_controller.dart';
import 'package:jiffy_fuels/controllers/connectivity_controller.dart';
import 'package:jiffy_fuels/controllers/location_controller.dart';

yesNoDialog(context, text, onTap) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColor.bodyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        content: Builder(
          builder: (context) {
            return SizedBox(
              height: ScreenSize.height(context) * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: ScreenSize.height(context) * 0.05),
                  Row(
                    children: [
                      //NO BUTTON
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: ScreenSize.height(context) * 0.055,
                            width: ScreenSize.width(context) * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'No',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      //YES BUTTON
                      Expanded(
                        child: InkWell(
                          onTap: onTap,
                          child: Container(
                            height: ScreenSize.height(context) * 0.055,
                            // width: width(context) * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

imageEnlargeFileDialog({required BuildContext context, required String image}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        content: Builder(
          builder: (context) {
            return Container(
              height: ScreenSize.height(context) * 0.6,
              width: ScreenSize.width(context),
              child: Column(
                children: [
                  ///IMAGE
                  Container(
                    height: ScreenSize.height(context) * 0.5,
                    width: ScreenSize.width(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        height: 150.0,
                        width: 100.0,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 50,
                      // width: width(context) * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

void showInternetDialog() {
  Get.dialog(
      barrierDismissible: false,
      AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    insetPadding: const EdgeInsets.symmetric(horizontal: 15),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    title: const Text('No Internet Connection'),
    content: const Text(
        'Please turn on internet to continue using the application.'),
    actions: [
      InkWell(
        onTap: () {
          connectivityController.isInternetAlertShowing.value = false;
          connectivityController.update();
          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child:  Text(
            'Retry',
            style: TextStyle(
              fontSize: 18.0,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  ));
}

void showGpsDialog() {
  Get.dialog(
    barrierDismissible: false,
    AlertDialog(
      backgroundColor: AppColor.bodyColor,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      title: const Text('GPS Disabled'),
      content: const Text('Please turn on location to add assets and place order.'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //NO BUTTON
            InkWell(
              onTap: () async {
                connectivityController.isGpsAlertShowing.value = false;
                await locationController.getLocationPermission();
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: const Center(
                  child: Text(
                    'Retry',
                    style: TextStyle(fontSize: 18.0, color: AppColor.primaryColor),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            //YES BUTTON
            InkWell(
              onTap: () {
                connectivityController.isGpsAlertShowing.value = false;
                Geolocator.openLocationSettings();
                locationController.getLatestAddress().whenComplete(() {
                  if (assetController.selectedAssetIndex.value == -1) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      assetController.updateAssetInfoForFilter(null);
                    });
                  } else {
                    //DO NOT LOAD ANYTHING
                  }
                });
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: const Center(
                  child: Text(
                    'Open Settings',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
