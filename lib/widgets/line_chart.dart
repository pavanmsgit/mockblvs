import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/order_controller.dart';
import 'package:mrx_charts/mrx_charts.dart';

class LinePage extends StatefulWidget {
  const LinePage({Key? key}) : super(key: key);

  @override
  State<LinePage> createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: 600.0,
              maxWidth: ScreenSize.width(context) * 0.95
          ),
          padding: const EdgeInsets.all(24.0),
          child:
          orderController.orderQuantityListForDashboard.length != 0 ? Chart(
            layers: layers(),
            padding: const EdgeInsets.symmetric(horizontal: 30.0).copyWith(
              bottom: 12.0,
            ),
          ) :
          Center(child:
            Text(
              "NO DATA",
              style: TextStyle(
                color: AppColor.blackMild,
                letterSpacing: 0.2,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            )
            ,)
        ),
      ),
    );
  }

  List<ChartLayer> layers() {

    ///SHOWING LAST 5 MONTHS DATA
    final from = DateTime.now().subtract(Duration(days: 120));
    final to = DateTime.now().subtract(Duration(days: 0));
    final frequency = (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 4.0;


    return [
      ChartHighlightLayer(
        shape: () => ChartHighlightLineShape<ChartLineDataItem>(
          backgroundColor: AppColor.transparent,
          currentPos: (item) => item.currentValuePos,
          radius: const BorderRadius.all(Radius.circular(8.0)),
          width: 60.0,
        ),
      ),


      ChartAxisLayer(
        settings: ChartAxisSettings(
          x: ChartAxisSettingsAxis(
            frequency: frequency,

            min: from.millisecondsSinceEpoch.toDouble(),
            max: to.millisecondsSinceEpoch.toDouble(),

            textStyle: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),


          y: ChartAxisSettingsAxis(
            frequency: orderController.yAxisFrequency/5,
            max: orderController.yAxisFrequency,
            min: 0.0,
            textStyle: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 10.0,
            ),
          ),
        ),


        labelX: (value) => DateFormat('MMM')
            .format(DateTime.fromMillisecondsSinceEpoch(value.toInt())),

        labelY: (value) => value.toDouble().toString(),
      ),


      //X - VALUE
      ChartLineLayer(

        items:
        List.generate(
          orderController.orderQuantityListForDashboard.length,
              (index) => ChartLineDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: orderController.orderQuantityListForDashboard[index],
          ),
        ),


        settings: const ChartLineSettings(
          color: AppColor.primaryColor,
          thickness: 3.0,
        ),


      ),


      ChartTooltipLayer(
        shape: () => ChartTooltipLineShape<ChartLineDataItem>(
          //tooltip
          backgroundColor: AppColor.primaryColor,
          circleBackgroundColor: AppColor.blackMild,
          circleBorderColor: AppColor.blackMild,
          circleSize: 4.0,
          circleBorderThickness: 2.0,


          currentPos: (item) => item.currentValuePos,

          onTextValue: (item) => '${item.value.toInt()} Liters',

          marginBottom: 5.0,

          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),

          radius: 6.0,

          textStyle: const TextStyle(
            color: AppColor.white,
            letterSpacing: 0.2,
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
  }
}