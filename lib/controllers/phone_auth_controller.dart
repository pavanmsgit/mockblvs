// ignore_for_file:prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors,file_names
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mockblvs/widgets/loading_widget.dart';
import 'package:mockblvs/widgets/otp_timer_button.dart';
import 'package:mockblvs/widgets/toast_message.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

final PhoneAuthController phoneAuthController = Get.find<PhoneAuthController>();

class PhoneAuthController extends GetxController {
  RxBool phoneAvailable = true.obs,
      loginObscure = false.obs,
      registerPasswordObscure = false.obs,
      registerConfirmObscure = false.obs;

  RxString verify = "".obs;
  TextEditingController countryCode = TextEditingController();

  ///IN USE IN VERIFY OTP PAGE
  RxString code = "".obs;

  ///OTP FIELD CONTROLLER
  TextEditingController pinController = TextEditingController();

  ///
  OtpTimerButtonController otpTimerButtonController =
  OtpTimerButtonController();

  ///OTP AUTOFILL
  final smartAuth = SmartAuth();
  void getAppSignature() async {
    final res = await smartAuth.getAppSignature();
    debugPrint('Signature: $res');
  }

  void getSmsCode() async {
    final res = await smartAuth.getSmsCode();
    if (res.succeed) {
      debugPrint('SMS: ${res.code}');
    } else {
      debugPrint('SMS Failure:');
    }
  }

  void removeSmsListener() {
    smartAuth.removeSmsListener();
  }

  FocusNode mobileNode = FocusNode(),
      mobileForgotPasswordNode = FocusNode(),
      mobileSignUpNode = FocusNode(),
      otpNode = FocusNode(),
      nameNode = FocusNode(),
      emailNode = FocusNode(),
      passwordNode = FocusNode(),
      confirmPasswordNode = FocusNode();

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      mobile = TextEditingController(),
      mobileForgotPassword = TextEditingController(),
      mobileSignUp = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController(),
      otp = TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>(),
      loginKey = GlobalKey<FormState>(),
      forgotPassword = GlobalKey<FormState>(),
      signUpKey = GlobalKey<FormState>(),
      otpPageKey = GlobalKey<FormState>(),
      otpForgotPasswordKey = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  PhoneAuthService authService = PhoneAuthService();
  UserData userData = UserData();

  isPhoneAvailable({String? val}) async {
    try {
      var res = await authService.checkPhone(phone: val!);
      phoneAvailable.value = res == 0;
    } catch (_) {
      phoneAvailable.value = false;
    }
  }

  //CHECKING IF USER IS LOGGED IN OR NOT
  checkAuth() {
    Future.delayed(2.seconds, () async {
      String user = await userData.getUserPhone();
      if (user.isEmpty) {
        Get.off(() => const LoginScreen());
      } else {
        Get.off(() => const MainScreenRoot());
      }
    });
  }

  ///LISTENS TO OTP
  void listenOtp() async {
    await SmsAutoFill().listenForCode();
    update();
    debugPrint("OTP Listen is called");
  }

  checkForUserAndSendOtpToTheDevice() async {
    if (mobileSignUp.text.isEmpty) {
      showToast('Enter Valid Number', ToastGravity.BOTTOM);
    } else {
      var res = await authService.checkUserLoggedInDatabase(phone: mobileSignUp.text);
      if (res == 1) {
        showToast('User is already registered. Please Login.', ToastGravity.BOTTOM);
        mobileSignUp.clear();
      } else {
        mobileSignUpNode.unfocus();
        sendOtpRegular();
      }
    }
  }

  sendOtpRegular() async {
    closeKeyboard();
    showSpinner();

    // var appSignatureId = await SmsAutoFill().getAppSignature;
    //
    //
    // Map sendOtpData = {
    //   "mobile_number":mobileSignUp.text,
    //   "app_signature_id":appSignatureId,
    // };

    String countryCode = '+91';
    auth.verifyPhoneNumber(
        phoneNumber: countryCode + mobileSignUp.text,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          otpNode.unfocus();
          closeKeyboard();
          showSpinner();
          auth.signInWithCredential(authCredential).then((result) async {
            var res = await authService.checkUserLoggedInDatabase(
                phone: mobileSignUp.text);
            hideSpinner();
            if (res == 0) {
              await userData.setUserPhone(phone: mobileSignUp.text);
              password.clear();
              Get.to(() => const RegisterScreen());
            } else {
              showToast('User already exists', ToastGravity.BOTTOM);
            }
          }).catchError((_) {
            hideSpinner();
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          hideSpinner();
          showToast('OTP verification failed. Try again.',
              ToastGravity.BOTTOM);
        },
        codeSent: (verId, i) async {
          phoneAuthController.verify.value = verId;
          hideSpinner();
          closeKeyboard();
          showSpinner();
          otp = TextEditingController(text: '');
          pinController = TextEditingController(text: '');
          Future.delayed(Duration(seconds: 1), () {
            hideSpinner();
            Get.to(() => OtpScreen());
          });
          update();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          phoneAuthController.verify.value = verificationId;
        });
  }

  //FORGOT PASSWORD PAGE - MAIN METHOD
  sendOtpToDeviceForgotPassword() async {
    //if (forgotPassword.currentState!.validate()) {
    if (mobileForgotPassword.text.isEmpty) {
      showToast('Enter Valid Number', ToastGravity.BOTTOM);
    } else {
      var res = await authService.checkUserLoggedInDatabase(
          phone: mobileForgotPassword.text);
      if (res == 1) {
        mobileForgotPasswordNode.unfocus();
        sendOtpForgotPassword();
      } else {
        showToast('User Not Found', ToastGravity.BOTTOM);
        mobileForgotPassword.clear();
        Get.back();
      }
    }
  }

  //FORGOT PASSWORD PAGE - FOLLOWS CHAIN OF RESPONSIBILITY - TRIES FOR THE CONDITION TWICE
  sendOtpForgotPassword() async {
    try {
      closeKeyboard();
      closeKeyboard();
      showSpinner();
      String countryCode = '+91';

      auth.verifyPhoneNumber(
          phoneNumber: "$countryCode${mobileForgotPassword.text}",
          //phoneNumber: "+918296731873",
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) async {
            otpNode.unfocus();
            closeKeyboard();
            showSpinner();
            auth.signInWithCredential(authCredential).then((result) async {
              var res = await authService.checkUserLoggedInDatabase(
                  phone: mobileForgotPassword.text);
              hideSpinner();
              if (res == 0) {
                showToast('User Not Found', ToastGravity.BOTTOM);
              } else {
                //await userData.setUserPhone(phone: mobileForgotPassword.text);
                Get.to(() => const ChangePasswordForgotPassword());
              }
            }).catchError((_) {
              hideSpinner();
            });
          },
          verificationFailed: (authException) {
            // print(authException);
            hideSpinner();
            showToast('OTP verification failed. Try again.',
                ToastGravity.BOTTOM);
          },
          codeSent: (verId, i) async {
            phoneAuthController.verify.value = verId;
            hideSpinner();
            closeKeyboard();
            showSpinner();
            otp = TextEditingController(text: '');
            pinController = TextEditingController(text: '');
            Future.delayed(Duration(seconds: 1), () {
              hideSpinner();
              Get.to(() => OtpScreenForgotPassword());
            });
            update();
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            phoneAuthController.verify.value = verificationId;
            // print(verificationId);
          });
    } catch (error) {
      try {
        Future.delayed(Duration(seconds: 2), () async {
          closeKeyboard();
          showSpinner();
          String countryCode = '+91';
          auth.verifyPhoneNumber(
              phoneNumber: "$countryCode${mobileForgotPassword.text}",
              //phoneNumber: "+918296731873",
              timeout: const Duration(seconds: 60),
              verificationCompleted: (AuthCredential authCredential) async {
                otpNode.unfocus();
                closeKeyboard();
                showSpinner();
                auth.signInWithCredential(authCredential).then((result) async {
                  var res = await authService.checkUserLoggedInDatabase(
                      phone: mobileForgotPassword.text);
                  hideSpinner();
                  if (res == 0) {
                    showToast('User Not Found', ToastGravity.BOTTOM);
                  } else {
                    Get.to(() => const ChangePasswordForgotPassword());
                  }
                }).catchError((_) {
                  hideSpinner();
                });
              },
              verificationFailed: (authException) {
                // print(authException);
                hideSpinner();
                showToast('OTP verification failed. Try again.',
                    ToastGravity.BOTTOM);
              },
              codeSent: (verId, i) async {
                phoneAuthController.verify.value = verId;
                hideSpinner();
                closeKeyboard();
                showSpinner();
                otp = TextEditingController(text: '');
                pinController = TextEditingController(text: '');
                Future.delayed(Duration(seconds: 1), () {
                  hideSpinner();
                  Get.to(() => OtpScreenForgotPassword());
                });
                update();
              },
              codeAutoRetrievalTimeout: (String verificationId) {
                phoneAuthController.verify.value = verificationId;
                // print(verificationId);
              });
        });
      } catch (error) {
        debugPrint("UNABLE TO SEND OTP $error");
      }
    }
  }

  //REGISTRATION SCREEN
  verifyOtpAtOtpPage(context) async {
    // if (otpPageKey.currentState!.validate()) {
    if (phoneAuthController.code.value.length != 6) {
      showToast('Enter Valid 6 digit OTP', ToastGravity.BOTTOM);
    } else {
      try {
        otpNode.unfocus();
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: phoneAuthController.verify.value,
          smsCode: phoneAuthController.code.value,
        );
        closeKeyboard();
        showSpinner();
        await auth.signInWithCredential(credential).then((result) async {
          ///VERIFYING OTP AND NAVIGATING TO NEXT PAGE
          verifyOtp(context);
        }).catchError((e) {
          hideSpinner();
          showToast('OTP verification failed. Try again.',
              ToastGravity.BOTTOM);
        });
      } catch (e) {
        print("WRONG OTP : $e");
        hideSpinner();
      }
    }
    // }
  }

  //FORGOT PASSWORD SCREEN
  verifyOtpAtOtpPageForgotPassword(context) async {
    //if (otpForgotPasswordKey.currentState!.validate()) {
    if (phoneAuthController.code.value.length != 6) {
      showToast('Enter Valid 6 digit OTP', ToastGravity.BOTTOM);
    } else {
      try {
        otpNode.unfocus();
        var credential = PhoneAuthProvider.credential(
          verificationId: phoneAuthController.verify.value,
          smsCode: phoneAuthController.code.value,
        );
        closeKeyboard();
        showSpinner();
        auth.signInWithCredential(credential).then((result) async {
          ///VERIFYING OTP AND NAVIGATING TO NEXT PAGE
          verifyOtpForgotPassword(context);
        }).catchError((e) {
          hideSpinner();
          showToast('OTP verification failed. Try again.',
              ToastGravity.BOTTOM);
        });
      } catch (e) {
        // print(e);
        hideSpinner();
      }
    }
    //  }
  }

  Future verifyOtp(context) async {
    try {
      closeKeyboard();
      showSpinner();
      var user =
      await authService.checkUserLoggedInDatabase(phone: mobileSignUp.text);
      hideSpinner();
      if (user == 1) {
        showToast('Account Already Exists', ToastGravity.BOTTOM);
      } else if (user == 0) {
        showToast('Verified Phone Number', ToastGravity.BOTTOM);
        otp = TextEditingController(text: '');
        pinController = TextEditingController(text: '');
        update();
        await userData.setUserPhone(phone: mobile.text);
        Get.to(() => const RegisterScreen());
      } else {
        showToast('Please retry after sometime', ToastGravity.BOTTOM);
      }
    } catch (e) {
      hideSpinner();
      showToast('OTP verification failed. Try again.',
          ToastGravity.BOTTOM);
    }
  }

  Future verifyOtpForgotPassword(context) async {
    try {
      closeKeyboard();
      showSpinnerCustom(
          customWidget: Center(child: Lottie.asset(AppImages.loadingFuel),)
      );


      var user = await authService.checkUserLoggedInDatabase(phone: mobileForgotPassword.text);

      hideSpinner(
      );


      if (user == 1) {
        showToast('Verified', ToastGravity.BOTTOM);
        otp = TextEditingController(text: '');
        pinController = TextEditingController(text: '');
        update();
        Get.to(() => const ChangePasswordForgotPassword());
      } else if (user == 0) {
        showToast('Account Not Found', ToastGravity.BOTTOM);
      } else {
        showToast('OTP verification failed. Try again.',
            ToastGravity.BOTTOM);
      }
    } catch (e) {
      hideSpinner();
      showToast('OTP verification failed. Try again.',
          ToastGravity.BOTTOM);
    }
  }

  ///LOGIN USER - IF ALREADY REGISTERED
  loginUser() async {
    /// if (loginKey.currentState!.validate()) {
    if (mobile.text.length != 10) {
      showToast("Enter a valid phone number", ToastGravity.BOTTOM);
      return;
    } else if (password.text.length < 6) {
      showToast(
          "The password should have minimum 6 characters", ToastGravity.BOTTOM);
      return;
    } else if (mobile.text.isEmpty) {
      showToast("Enter Phone Number", ToastGravity.BOTTOM);
      return;
    } else if (password.text.isEmpty) {
      showToast("Enter Password", ToastGravity.BOTTOM);
      return;
    }

    closeKeyboard();

    showSpinnerCustom(
      customWidget: Center(child: Lottie.asset(AppImages.loadingFuel)),
    );

    try {
      int res = await authService.checkIfUserIsRegistered(
          phone: mobile.text, password: password.text);

      if (res == 1) {
        if(Platform.isAndroid){
          await userController.userService.registerTokenToDB(phone: mobile.text);
        }

        await userData.setUserPhone(phone: mobile.text);

        phoneAuthController.mobile.clear();
        phoneAuthController.password.clear();
        homeController.selectedTab.value = 0;

        Get.offAll(
              () => const MainScreenRoot(),
        );

        Future.delayed(Duration(seconds: 2),()=>hideSpinner());

      } else {
        showToast('Invalid Phone or Password', ToastGravity.BOTTOM);

        Future.delayed(Duration(seconds: 2),()=>hideSpinner());
      }

    } catch (err) {
      showToast('Please check your internet connection', ToastGravity.BOTTOM);
    }
    // }
  }

  // checkIfUserExists() async {
  //     hideKeyboard();showSpinner();
  //     try {
  //       int res = await authService.checkIfUserIsRegisteredPhone(
  //           phone: mobileForgotPassword.text);
  //       if (res == 1) {
  //         //await userData.setUserPhone(phone: mobile.text);
  //         sendOtpForgotPassword();
  //         Get.to(
  //               () => OtpScreen(pageCode: 1,),
  //           transition: Transition.rightToLeft,
  //           duration: 0.5.seconds,
  //         );
  //       } else {
  //         showToast('User Not Found',ToastGravity.BOTTOM);
  //         Get.back();
  //       }
  //     } catch (err) {
  //       showToast('Please restart the application.',ToastGravity.BOTTOM);
  //     }
  //     hideSpinner();
  // }

  submitRegister() async {
    if (!phoneAvailable.value) {
      showToast('Phone is already registered', ToastGravity.BOTTOM);
      return;
    } else if (name.text == '') {
      showToast('Please enter Name', ToastGravity.BOTTOM);
      return;
    } else if (email.text == '') {
      showToast('Please enter Email', ToastGravity.BOTTOM);
      return;
    } else if (!email.text.isEmail) {
      showToast('Please enter valid Email', ToastGravity.BOTTOM);
      return;
    } else if (password.text.length < 6 && confirmPassword.text.length < 6) {
      showToast('Password should be minimum 6 characters', ToastGravity.BOTTOM);
      return;
    } else if (password.text != confirmPassword.text) {
      showToast('Both passwords should match', ToastGravity.BOTTOM);
      return;
    } else
      //if (registerKey.currentState!.validate())
        {
      closeKeyboard();
      showSpinnerCustom(
        customWidget: Center(child: Lottie.asset(AppImages.loadingFuel)),
      );

      await notificationController.getDeviceToken();

      try {
        bool res = await authService.registerUser(
            name: name.text,
            email: email.text,
            phone: mobileSignUp.text,
            password: password.text,
            token: notificationController.deviceToken);

        if (res) {
          await userData.setUserPhone(phone: mobileSignUp.text);
          homeController.selectedTab.value = 0;
          clearAllFields();
          Get.offAll(() => const MainScreenRoot());
        }
      } catch (err) {
        debugPrint("Error : $err");
      }
      hideSpinner();
    }
  }

  clearAllFields() {
    mobile.clear();
    mobileSignUp.clear();
    mobileForgotPassword.clear();
    password.clear();
    name.clear();
    email.clear();
    confirmPassword.clear();
    pinController.clear();
    update();
  }
}
