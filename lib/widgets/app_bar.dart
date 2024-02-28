import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/home_controller.dart';

titleAppBar(context) {
  return AppBar(
    backgroundColor: AppColor.white,
    centerTitle: true,
    elevation: 0,
    // toolbarHeight: 50,
    toolbarOpacity: 1.0,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Obx(
            () => Center(
          child: AutoSizeText(homeController.appBarTitles.elementAt(homeController.selectedTab.value),
            minFontSize: 18,
            maxFontSize: 34,
            style: const TextStyle(
                color: AppColor.appBarTitleTextColor,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
        ),
      ),
    ),


    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //       bottomRight: Radius.circular(15),
    //       bottomLeft: Radius.circular(15)),
    // ),
    // flexibleSpace: FlexibleSpaceBar(
    //   background: Container(
    //     color: AppColor.white,
    //     margin: const EdgeInsets.only(bottom: 0,top: 0),
    //     child: Stack(
    //       children: <Widget>[
    //         //THE TOP COLOR BAR
    //         Container(
    //           height: ScreenSize.height(context) * 0.01,
    //           decoration: const BoxDecoration(
    //             color: AppColor.primaryColor,
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(0),
    //               bottomRight: Radius.circular(0),
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           top: 10,
    //           bottom: 0,
    //           left: 0,
    //           right: 0,
    //           child: Container(
    //             alignment: Alignment.center,
    //             margin:
    //             const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    //             padding: const EdgeInsets.symmetric(horizontal: 0),
    //             height: 0,
    //             decoration: BoxDecoration(
    //               color: AppColor.white,
    //               borderRadius: const BorderRadius.only(
    //                 bottomLeft: Radius.circular(0),
    //                 bottomRight: Radius.circular(0),
    //               ),
    //               // boxShadow: [
    //               //   BoxShadow(
    //               //     offset: const Offset(0, 5),
    //               //     blurRadius: 25,
    //               //     color: AppColor.primaryColor.withOpacity(0.2),
    //               //   ),
    //               // ],
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 5, bottom: 0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(bottom: 5),
    //                     child: Obx(
    //                         () => Center(
    //                           child: Text(homeController.appBarTitles.elementAt(homeController.selectedTab.value),
    //                             style: const TextStyle(
    //                                 color: AppColor.blackMild,
    //                                 fontWeight: FontWeight.bold,
    //                                 fontSize: 15),
    //                           ),
    //                         ),
    //                     ),
    //                   ),
    //
    //                   //DIVIDER
    //                   Container(
    //                     color:AppColor.white,
    //                     width: ScreenSize.width(context) * 0.75,
    //                     child: Divider(
    //                       height: ScreenSize.height(context) * 0.01,
    //                       thickness: 2,
    //                       color: AppColor.black.withOpacity(0.4),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
  );
}




titleAppBarCustom(
    {

      required BuildContext? context,
      required String? title,
    List<Widget>? actions,
    Widget? tabBars}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100.0),
    child: AppBar(
      actions: actions ?? [],
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: tabBars ?? Container(height: 1,)
      ),

      toolbarHeight: 50,
      toolbarOpacity: 1.0,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //       bottomRight: Radius.circular(15),
      //       bottomLeft: Radius.circular(15)),
      // ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: AppColor.white,
          margin: const EdgeInsets.only(bottom: 0,top: 0),
          child: Stack(
            children: <Widget>[
              //THE TOP COLOR BAR
              Container(
                height: ScreenSize.height(context) * 0.01,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  height: 0,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0, 5),
                    //     blurRadius: 25,
                    //     color: AppColor.primaryColor.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Obx(
                                () => Center(
                              child: Text(homeController.appBarTitles.elementAt(homeController.selectedTab.value),
                                style: const TextStyle(
                                    color: AppColor.blackMild,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ),

                        //DIVIDER
                        Container(
                          color:AppColor.white,
                          width: ScreenSize.width(context) * 0.75,
                          child: Divider(
                            height: ScreenSize.height(context) * 0.01,
                            thickness: 2,
                            color: AppColor.black.withOpacity(0.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

titleAppBarWithBackButton(
    {required String? title,
    required String? subTitle,
    Function()? onPress,
    List<Widget>? actions,
    Widget? tabBars}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColor.white,
    actions: actions ?? [],
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: AppColor.primaryColor,
        size: 25.0,
      ),
      onPressed: onPress ??
              () {
            Get.back();
          },
    ),
    centerTitle: true,
    title: AutoSizeText(
      title ?? '',
      style: const TextStyle(
          color: AppColor.appBarTitleTextColor, fontWeight: FontWeight.bold),
    ),
    // bottom: PreferredSize(
    //   preferredSize: const Size.fromHeight(0.0),
    //   child: tabBars ??
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: AutoSizeText(
    //           subTitle ?? '',
    //           style: const TextStyle(
    //               color: AppColor.white,
    //               fontSize: 13,
    //               fontWeight: FontWeight.w400),
    //         ),
    //       ),
    // ),
  );
}




class SliverAppBarLogo extends StatelessWidget {
  SliverAppBarLogo({Key? key, this.title}) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      stretch: false,
      //pinned: true,

      leading: Container(),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          margin: const EdgeInsets.only(bottom: 0),
          // It will cover 20% of our total height
          //height: ScreenSize.height(context) * 0.2,
          child: Stack(
            children: <Widget>[
              //THE TOP COLOR BAR
              Container(
                height: ScreenSize.height(context) * 0.01,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  height: 0,
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0, 5),
                    //     blurRadius: 25,
                    //     color: AppColor.primaryColor.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Center(
                              child: Text(
                            title ?? "Jiffy Retailer",
                            style: TextStyle(
                                color: AppColor.blackMild,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                        Container(
                          width: ScreenSize.width(context) * 0.75,
                          child: Divider(
                            height: ScreenSize.height(context) * 0.01,
                            thickness: 2,
                            color: AppColor.black.withOpacity(0.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      expandedHeight: 50,
      collapsedHeight: 50,
      toolbarHeight: 50,
      backgroundColor: Colors.transparent,
      //pinned: false,
      elevation: 3.0,
    );
  }
}

class SliverAppBarLogoWithBackButton extends StatelessWidget {
  SliverAppBarLogoWithBackButton(
      {Key? key, this.onPressMethod, this.title, this.appBarColor})
      : super(key: key);
  String? title;
  var onPressMethod;
  Color? appBarColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: false,
      stretch: false,
      //pinned: true,
      toolbarHeight: 50,
      leading: IconButton(
        padding: EdgeInsets.only(top: 10),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: AppColor.blackMild,
          size: 25,
        ),
        onPressed: onPressMethod ??
            () {
              Get.back(canPop: true);
            },
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: appBarColor ?? AppColor.white,
          margin: const EdgeInsets.only(bottom: 10),
          // It will cover 20% of our total height
          //height: ScreenSize.height(context) * 0.2,
          child: Stack(
            children: <Widget>[
              //THE TOP COLOR BAR
              Container(
                height: ScreenSize.height(context) * 0.01,
                decoration: const BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  height: 0,
                  decoration: BoxDecoration(
                    color: appBarColor ?? AppColor.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     offset: const Offset(0, 5),
                    //     blurRadius: 25,
                    //     color: AppColor.primaryColor.withOpacity(0.2),
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Center(
                              child: Text(
                            title ?? "Jiffy Fuels",
                            style: const TextStyle(
                                color: AppColor.blackMild,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),

                        //DIVIDER
                        Container(
                          color: appBarColor ?? AppColor.white,
                          width: ScreenSize.width(context) * 0.75,
                          child: Divider(
                            height: ScreenSize.height(context) * 0.01,
                            thickness: 2,
                            color: AppColor.black.withOpacity(0.4),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      expandedHeight: 75,
      collapsedHeight: 50,
      backgroundColor: Colors.transparent,
      //pinned: false,
      elevation: 3.0,
    );
  }
}

// class SliverAppBarLogoWithBackButtonAndExpandedImage extends StatelessWidget{
//   SliverAppBarLogoWithBackButtonAndExpandedImage({Key? key, this.image,this.title}) : super(key: key);
//   String? image;
//   String? title;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  SliverAppBar(
//       floating: false,
//       stretch: false,
//       toolbarHeight: ScreenSize.height(context) * 0.1,
//       leading: IconButton(
//         padding: EdgeInsets.only(top: ScreenSize.height(context) * 0.025),
//         icon: const Icon(
//           Icons.arrow_back_ios,
//           color: AppColor.primaryColor,
//           size: 30,
//         ),
//         onPressed: () {
//           Get.back();
//         },
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         background: Container(
//           margin: const EdgeInsets.only(bottom: 0),
//           // It will cover 20% of our total height
//           //height: ScreenSize.height(context) * 0.2,
//           child: Stack(
//             children: <Widget>[
//               //THE TOP COLOR BAR
//               Container(
//                 height: ScreenSize.height(context) * 0.1,
//                 decoration: const BoxDecoration(
//                   color: AppColor.primaryColor,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(0),
//                     bottomRight: Radius.circular(0),
//                   ),
//                 ),
//               ),
//               //BASIC APP BAR WITH LOGO AND DIVIDER LINE
//               Positioned(
//                 top: 25,
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.symmetric(
//                       horizontal: 0, vertical: 0),
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 0),
//                   height: 0,
//                   decoration: const BoxDecoration(
//                     color: AppColor.white,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(0),
//                       bottomRight: Radius.circular(0),
//                     ),
//                   ),
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.only(top: 0, bottom: 0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding:
//                           const EdgeInsets.only(bottom: 5),
//                           child: Center(
//                               child: Text(
//                                 title ?? "Jiffy Fuels",
//                                 style: TextStyle(
//                                     color: AppColor.blackMild,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 15),
//                               )),
//                         ),
//                         const Divider(
//                           height: 5,
//                           thickness: 1,
//                           color: AppColor.primaryColorAlt,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//
//               Positioned(
//                 top: ScreenSize.height(context)*0.1,
//                 bottom: ScreenSize.height(context)*0.025,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: Image.network(
//                      image,
//                       width: ScreenSize.width(context),
//                       height: ScreenSize.height(context)*0.25,
//                       fit: BoxFit.fill,
//                       //cancelToken: cancellationToken,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       expandedHeight: ScreenSize.height(context)*0.4,
//       backgroundColor: Colors.transparent,
//       // bottom: PreferredSize(
//       //   preferredSize: ,
//       //   child: Text('HEY'),
//       //
//       // ),
//     );
//   }
// }
