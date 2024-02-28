import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';


// ignore: must_be_immutable
class TitleTextField extends StatelessWidget {
  TitleTextField(
      {Key? key,
      required this.title,
      this.keyboardType,
      this.customHeight,
      this.controller,
      this.padding,
      this.icon,
      this.iconData,
      this.enabled = true,
      this.hint = '',
      this.onChanged,
      this.validator,
      this.iconTap,
      this.node,
      this.onSubmit,
      this.obscure = false,
      this.maxLength,
      this.cursorColor,
      this.textColor,
      this.hintTextColor,
      this.len,
      this.textSize,
      this.hintTextSize,
      this.maxLines,
      this.textAlign
      })
      : super(key: key);

  final String title;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  bool enabled;
  String hint;
  Function(String?)? onChanged;
  Function()? iconTap;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  Color? hintTextColor;
  double? textSize;
  double? hintTextSize;
  int? len;
  int? maxLines;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: padding == 0 ? 0 : 5),
          CustomTextField(
            customHeight: customHeight,
            keyboardType: keyboardType,
            controller: controller,
            hintText: hint,
            icon: icon,
            iconData: iconData,
            enabled: enabled,
            onChanged: onChanged,
            validator: validator,
            iconTap: iconTap,
            maxLines: maxLines,
            obscure: obscure,
            node: node,
            onSubmit: onSubmit,
            maxLength: maxLength,
            cursorColor: cursorColor,
            textColor: textColor,
            hintTextColor: hintTextColor,
            len: len,
            textSize: textSize,
            hintTextSize: hintTextSize,
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.keyboardType,
      this.customHeight,
      this.padding,
      this.hintText = '',
      this.enabled = true,
      this.controller,
      this.icon,
      this.iconData,
      this.iconTap,
      this.obscure = false,
      this.onChanged,
      this.validator,
      this.node,
      this.onSubmit,
      this.maxLength,
      this.cursorColor,
      this.hintTextColor,
      this.textColor,
      this.len,
      this.textSize,
      this.hintTextSize,
      this.maxLines,
      this.textAlign
      })
      : super(key: key);

  TextInputType? keyboardType;
  String? hintText;
  bool? enabled;
  TextEditingController? controller;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  Function()? iconTap;
  Function(String?)? onChanged;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  double? textSize;
  Color? hintTextColor;
  double? hintTextSize;
  int? len;
  int? maxLines;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context),
      height: customHeight ?? ScreenSize.height(context) * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          ),

      child: TextField(
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        inputFormatters: [
          LengthLimitingTextInputFormatter(len),
        ],
        cursorColor: AppColor.primaryColor,
        enabled: enabled,
        focusNode: node,
        controller: controller,
        onChanged: onChanged,
        //validator: validator,
        maxLines: maxLines ?? 1,
        onSubmitted: onSubmit,
        style: TextStyle(
            //fontSize: textSize ?? 13,
            color: textColor
        ),
        obscureText: obscure,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
          //icon: icon,
          prefixIcon: icon,
          fillColor: AppColor.primaryColor,
          //prefixIconConstraints: const BoxConstraints(maxHeight: double.infinity,maxWidth: double.infinity),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            //fontSize: hintTextSize ?? 15,
            color: hintTextColor,
              fontWeight: FontWeight.w500
          ),
          // suffixIcon: iconData != null
          //     ? IconButton(
          //   onPressed: iconTap,
          //   icon: Icon(
          //     iconData,
          //     size: 22,
          //     color: AppColor.primaryColor,
          //   ),
          // )
          //     : const SizedBox(
          //   height: 0.0001,
          //   width: 0.0001,
          // ),
        ),
      ),
    );
  }
}






// ignore: must_be_immutable
class TitleTextFieldForPassword extends StatelessWidget {
  TitleTextFieldForPassword(
      {Key? key,
        required this.title,
        this.keyboardType,
        this.customHeight,
        this.controller,
        this.padding,
        this.icon,
        this.iconData,
        this.enabled = true,
        this.hint = '',
        this.onChanged,
        this.validator,
        this.iconTap,
        this.node,
        this.onSubmit,
        this.obscure = false,
        this.maxLength,
        this.cursorColor,
        this.textColor,
        this.hintTextColor,
        this.len,
        this.textSize,
        this.hintTextSize,
        this.maxLines,
        this.textAlign
      })
      : super(key: key);

  final String title;
  TextEditingController? controller;
  TextInputType? keyboardType;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  bool enabled;
  String hint;
  Function(String?)? onChanged;
  Function()? iconTap;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  Color? hintTextColor;
  double? textSize;
  double? hintTextSize;
  int? len;
  int? maxLines;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: padding == 0 ? 0 : 5),
          CustomTextFieldForPassword(
            customHeight: customHeight,
            keyboardType: keyboardType,
            controller: controller,
            hintText: hint,
            icon: icon,
            iconData: iconData,
            enabled: enabled,
            onChanged: onChanged,
            validator: validator,
            iconTap: iconTap,
            maxLines: maxLines,
            obscure: obscure,
            node: node,
            onSubmit: onSubmit,
            maxLength: maxLength,
            cursorColor: cursorColor,
            textColor: textColor,
            hintTextColor: hintTextColor,
            len: len,
            textSize: textSize,
            hintTextSize: hintTextSize,
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomTextFieldForPassword extends StatelessWidget {
  CustomTextFieldForPassword(
      {Key? key,
        this.keyboardType,
        this.customHeight,
        this.padding,
        this.hintText = '',
        this.enabled = true,
        this.controller,
        this.icon,
        this.iconData,
        this.iconTap,
        this.obscure = false,
        this.onChanged,
        this.validator,
        this.node,
        this.onSubmit,
        this.maxLength,
        this.cursorColor,
        this.hintTextColor,
        this.textColor,
        this.len,
        this.textSize,
        this.hintTextSize,
        this.maxLines,
        this.textAlign
      })
      : super(key: key);

  TextInputType? keyboardType;
  String? hintText;
  bool? enabled;
  TextEditingController? controller;
  double? customHeight, padding;
  Icon? icon;
  IconData? iconData;
  Function()? iconTap;
  Function(String?)? onChanged;
  String? Function(String?)? validator;
  bool obscure;
  FocusNode? node;
  Function(String)? onSubmit;
  int? maxLength;
  Color? cursorColor;
  Color? textColor;
  double? textSize;
  Color? hintTextColor;
  double? hintTextSize;
  int? len;
  int? maxLines;
  TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context),
      height: customHeight ?? ScreenSize.height(context) * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextField(
        textAlign: textAlign ?? TextAlign.start,
        maxLength: maxLength,
        inputFormatters: [
          LengthLimitingTextInputFormatter(len),
        ],
        cursorColor: AppColor.primaryColor,
        enabled: enabled,
        focusNode: node,
        controller: controller,
        onChanged: onChanged,
        //validator: validator,
        maxLines: maxLines ?? 1,
        onSubmitted: onSubmit,
        style: TextStyle(
          //fontSize: textSize ?? 13,
            color: textColor
        ),
        obscureText: obscure,
        keyboardType: keyboardType ?? TextInputType.name,
        decoration: InputDecoration(
          //icon: icon,
          prefixIcon: icon,
          fillColor: AppColor.primaryColor,
          //prefixIconConstraints: const BoxConstraints(maxHeight: double.infinity,maxWidth: double.infinity),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            //fontSize: hintTextSize ?? 15,
              color: hintTextColor,
              fontWeight: FontWeight.w500
          ),
          suffixIcon: iconData != null
              ? IconButton(
            onPressed: iconTap,
            icon: Icon(
              iconData,
              size: 22,
              color: AppColor.primaryColor,
            ),
          )
              : const SizedBox(
            height: 0.0001,
            width: 0.0001,
          ),
        ),
      ),
    );
  }
}
