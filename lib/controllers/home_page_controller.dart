import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

final HomePageController homePageController = Get.find<HomePageController>();


class HomePageController extends GetxController{


  ///BOOL TO CHECK IF ANY BUTTON IS ALREADY PRESSED AND FUNCTIONS INSIDE IT ARE ALREADY RUNNING
  RxBool isProcessing = false.obs;

  get profile => null;


  updateIsProcessing(){
    isProcessing.value = true;
    update();
  }


  resetIsProcessing(){
    isProcessing.value = false;
    update();
  }


  // File? image;

  Rx<File?> imageProfile = Rx<File?>(null);

  selectProfileImage() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      imageProfile.value = File(img.path);
      update();
    }
  }




  /// SCAFFOLD MAIN SCREEN DRAWER BUTTON KEY
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


}