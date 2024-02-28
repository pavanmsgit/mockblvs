import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';

class OrderBottomBadge extends StatelessWidget {
  final String quantity;
  final String? text;
  final VoidCallback onPress;
  final Color color;

  const OrderBottomBadge({
    required Key key,
    required this.onPress,
    required this.quantity,
    this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        margin: EdgeInsets.only(
            bottom: defaultTargetPlatform == TargetPlatform.android ? 10 : 20),
        height: 60,
        width: ScreenSize.width(context) * 0.5,
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(1.0),
              foregroundColor: MaterialStateProperty.all<Color>(color),
              backgroundColor: MaterialStateProperty.all<Color>(color),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: color),
                ),
              ),
            ),
            onPressed: onPress,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    text ?? "CONTINUE",
                    minFontSize: 16.0,
                    maxFontSize: 24.0,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: AppColor.white),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
