import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({Key? key, required this.offer}) : super(key: key);
  final String offer;

  @override
  Widget build(BuildContext context) {
    return offer.isNotEmpty ? SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child:  Icon(Icons.percent_rounded,color: AppColor.primaryColor,size: 15,),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: AutoSizeText(
              offer,
              maxLines: 1,
              minFontSize: 8.0,
              maxFontSize: 24.0,
              style:const TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.darkGreyShade
              ),
            ),
          ),
        ],
      ),
    ) : Container(height: 0.0001,);
  }
}
