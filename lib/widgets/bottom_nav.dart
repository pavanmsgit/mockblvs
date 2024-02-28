import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/controllers/home_controller.dart';



class AppBottomNav extends StatefulWidget {
  const AppBottomNav({Key? key}) : super(key: key);

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  final HomeController hc = Get.find<HomeController>();

  //ICON LIST FOR BOTTOM NAVIGATION BAR
  final iconList = <IconData>[
    Icons.home,
    //Icons.search_rounded,
    Icons.add_location_alt_rounded,
    Icons.receipt_long_rounded,
    Icons.account_circle_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      backgroundColor:AppColor.white,
      activeColor: AppColor.primaryColor,
      notchMargin: 10,
      inactiveColor: AppColor.grey,
      activeIndex: hc.selectedTab.value,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      leftCornerRadius: 0,
      rightCornerRadius: 0,
      elevation: 10,
      onTap: (index) {
        setState(() {
          hc.selectedTab.value = index;
        });
      },
    );
  }
}





//return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       onTap: (index) => hc.selectedTab.value = index,
//       ///fixedColor: AppColor.primaryColor,
//       selectedItemColor: AppColor.primaryColor,
//       unselectedItemColor: AppColor.grey,
//       backgroundColor: AppColor.white,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_main),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.search_rounded),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.receipt_long_rounded),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.account_circle_rounded),
//           label: '',
//         ),
//       ],
//     );