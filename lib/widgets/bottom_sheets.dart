import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/asset_controller.dart';
import 'package:jiffy_fuels/controllers/location_controller.dart';
import 'package:jiffy_fuels/views/home_main/asset_management_screens/add_asset.dart';
import 'package:jiffy_fuels/views/home_main/asset_management_screens/asset_info.dart';
import 'package:jiffy_fuels/widgets/toast_message.dart';

//SHOWING LIST OF ASSETS BOTTOM SHEET
showAssetsListBottomSheet(context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColor.bodyColor,
    barrierColor: AppColor.white.withOpacity(0.75),
    useSafeArea : true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0))),
    builder: (BuildContext context) {
      return Container(
        color: AppColor.white,
        height: ScreenSize.height(context) * 0.8,
        child: CustomScrollView(
          slivers: [
            ///SELECT ASSET HEADER AND CANCEL BUTTON
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: AutoSizeText(
                          "Select Asset" ?? '',
                          minFontSize: 20.0,
                          maxFontSize: 32.0,
                          style: TextStyle(
                              color: AppColor.appBarTitleTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: AppColor.appBarTitleTextColor,
                              size: 40.0,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            ///ADD NEW ASSET TEXT BUTTON
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () {
                  Get.to(() => const AddAsset(),
                      transition: Transition.downToUp);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(left: 20, right: 0, top: 10),
                      child: const AutoSizeText(
                        'ADD NEW ASSET? ',
                        style: TextStyle(
                            color: AppColor.darkGreyShade,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(left: 0, right: 15, top: 10),
                      child: const AutoSizeText(
                        'CLICK HERE',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),




            const SliverPadding(
              padding: EdgeInsets.only(top: 20),
            ),

            const AssetInfoWidgetBottomSheet(),




            ///CURRENT LOCATION LIST TILE
            // const SliverPadding(
            //   padding: EdgeInsets.only(top: 10),
            // ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     decoration: const BoxDecoration(border: Border(bottom: BorderSide(
            //       color: AppColor.greyDivider
            //     ),),),
            //
            //     padding: const EdgeInsets.only(left: 5, right: 5),
            //     child: ListTile(
            //       onTap: (){
            //         locationController.getLatestAddress().whenComplete(() {
            //           Future.delayed(const Duration(milliseconds: 500), () {
            //             assetController.updateAssetInfoForFilter(null);
            //           });
            //         });
            //         assetController.selectedAssetIndex = (-1).obs;
            //         showToast('Please add asset to place a order', ToastGravity.CENTER);
            //         Get.back();
            //       },
            //
            //       leading: const Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: Icon(
            //           Icons.location_on,
            //           color: AppColor.primaryColor,
            //         ),
            //       ),
            //       title: const AutoSizeText(
            //         "Current Location",
            //         maxLines: 1,
            //         minFontSize: 8.0,
            //         maxFontSize: 24.0,
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       subtitle: AutoSizeText(
            //         assetController.selectedAsset.assetAddress,
            //         maxLines: 3,
            //         minFontSize: 8.0,
            //         maxFontSize: 24.0,
            //       ),
            //       isThreeLine: true,
            //       trailing: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(
            //           Icons.adjust_rounded,
            //           size: 25,
            //           color: assetController.selectedAssetIndex.value == -1
            //               ? AppColor.primaryColor
            //               : AppColor.grey,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    },
  );
}
