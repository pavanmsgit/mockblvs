import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/models/delivery_slot_timings.dart';

class AppDropdown extends StatelessWidget {
  const AppDropdown(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.text = '',
      this.title = '',
      required this.height,
      required this.width})
      : super(key: key);
  final List items;
  final String text;
  final String title;
  final double width;
  final double height;
  final Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 15.0,
        ),
        height: ScreenSize.height(context) * height,
        width: ScreenSize.width(context) * width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
          //border: Border.all(color: AppColor.greyLight)
        ),
        child: Center(
          child: DropdownButton(
            dropdownColor: AppColor.white,
            focusColor: AppColor.white,
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            iconEnabledColor: AppColor.primaryColor,
            iconDisabledColor: AppColor.greyShimmer,
            isExpanded: true,
            iconSize: 26,
            hint: AutoSizeText(
              text == "" ? title : text,
              style: TextStyle(
                  color: text == "" ? AppColor.hintTextColor : AppColor.black,
                  fontWeight: FontWeight.w500),
              minFontSize: 10.0,
              maxFontSize: 24.0,
              maxLines: 1,
            ),
            underline: Container(height: 0),
            items: items
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(color: AppColor.black),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}

class AppDropdownForListOfTimeSlots extends StatelessWidget {
  AppDropdownForListOfTimeSlots(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.text = ''})
      : super(key: key);
  final List<DeliverySlotTimings> items;
  final String text;
  final Function(Object?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenSize.width(context) * 0.01,
            vertical: ScreenSize.height(context) * 0.01),
        width: ScreenSize.width(context) * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
          //border: Border.all(color: AppColor.primaryColor)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(
              Icons.access_time_filled,
              color: AppColor.primaryColor,
               size: ScreenSize.width(context) * 0.05,
            ),

            SizedBox(
              width: ScreenSize.width(context) * 0.005,
            ),

            SizedBox(
              width: ScreenSize.width(context) * 0.3,
              height: ScreenSize.height(context) * 0.05,
              child: DropdownButton(
                dropdownColor: AppColor.white,
                focusColor: AppColor.white,
                iconEnabledColor: AppColor.primaryColor,
                iconDisabledColor: AppColor.greyShimmer,
                isExpanded: true,
                //isDense: true,
                alignment: AlignmentDirectional.center,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                ),
                hint: AutoSizeText(
                  text,
                  minFontSize: 8.0,
                  maxFontSize: 24.0,
                  style: TextStyle(
                      color: text == "Time Slot"
                          ? AppColor.hintTextColor
                          : AppColor.blackShade),
                ),

                underline: Container(height: 0.000001),

                items: items.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: AutoSizeText(
                      item.timeSlot!,
                      minFontSize: 8.0,
                      maxFontSize: 24.0,
                      style: const TextStyle(
                          color: AppColor.blackShade),
                    ),
                  );
                }).toList(),

                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
