import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/asset_controller.dart';
import 'package:jiffy_fuels/controllers/location_controller.dart';
import 'package:jiffy_fuels/models/coupon.dart';
import 'package:jiffy_fuels/widgets/bottom_sheets.dart';

class AddressBar extends StatefulWidget {
  const AddressBar({Key? key}) : super(key: key);

  @override
  State<AddressBar> createState() => _AddressBarState();
}

class _AddressBarState extends State<AddressBar> {
  @override
  void initState() {
    //TODO - FIND AN ALTERNATIVE
    // Future.delayed(const Duration(milliseconds: 5000), () {
    //   assetController.updateAssetInfoForFilter(null);
    // });
    //
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   locationController.getLocationPermission();
    //   locationController.getLatestAddress().whenComplete(() => true);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///ADDRESS BAR UI
    try{
      return GetBuilder(
        init: LocationController(),
        builder: (_) => GestureDetector(
          onTap: () async{
            //SHOWING LIST OF ASSETS BOTTOM SHEET ITEMS
            showAssetsListBottomSheet(context);
          },
          child: Container(
            color: AppColor.bodyColor,
            height: ScreenSize.height(context) * 0.12,
            width: ScreenSize.width(context),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //ASSET NAME TEXT AND
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_rounded,size:  30,color: AppColor.primaryColor,),

                    Obx(() =>  assetController.dummyBool.value ?
                    AutoSizeText(
                      assetController.selectedAsset.assetType == -1
                          ? "CHOOSE DELIVERY LOCATION"
                          : assetController.selectedAsset.assetName,
                      maxLines: 1,
                      minFontSize: 14,
                      maxFontSize: 24,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: AppColor.blackShade),
                    ) : AutoSizeText(
                      assetController.selectedAsset.assetType == -1
                          ? "CHOOSE DELIVERY LOCATION"
                          : assetController.selectedAsset.assetName,
                      maxLines: 1,
                      minFontSize: 14,
                      maxFontSize: 24,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: AppColor.blackShade),
                    ),),

                    //ARROW DOWN ICON
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColor.darkGreyShade,
                      size: 30,
                    ),
                  ],
                ),


                SizedBox(height : ScreenSize.height(context) * 0.005,),

                //ADDRESS
                SizedBox(
                  width: ScreenSize.width(context),
                  child: Obx(() =>  assetController.dummyBool.value ?
                  AutoSizeText(
                    assetController.selectedAsset.assetAddress.isEmpty
                        ? locationController.address.value
                        : assetController.selectedAsset.assetAddress,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    minFontSize: 10,
                    maxFontSize: 24,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColor.darkGreyShade,
                    ),
                  ) :   AutoSizeText(
                    assetController.selectedAsset.assetAddress.isEmpty
                        ? locationController.address.value
                        : assetController.selectedAsset.assetAddress,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    minFontSize: 10,
                    maxFontSize: 24,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppColor.darkGreyShade,
                    ),
                  ),),




                ),

                SizedBox(height : ScreenSize.height(context) * 0.005,),

                //DIVIDER
                SizedBox(
                  width: ScreenSize.width(context) * 0.9,
                  child: const Divider(
                    height: 10,
                    thickness: 1,
                    color: AppColor.blackMild,
                  ),
                )
              ],
            ),
          ),
        )
      );
    }catch(error){
      rethrow;
    }
  }
}
