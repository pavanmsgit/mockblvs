import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';

class RatingBarStatic extends StatelessWidget {
  const RatingBarStatic({Key? key, required this.ratings}) : super(key: key);
  final int ratings;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context) * 0.275,
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => const Padding(
          padding: EdgeInsets.all(2.5),
          child: Icon(
            Icons.star,
            size: 15,
            color: AppColor.starYellowColor,
          ),
        ),
        itemCount: ratings,
      ),
    );
  }
}
