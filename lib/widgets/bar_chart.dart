import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/order_controller.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:intl/intl.dart';

class BarPage extends StatefulWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
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
          child: Chart(
            layers: layers(),
            padding: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(
              bottom: 12.0,
            ),
          ),
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

        labelY: (value) => value.toInt().toString(),
      ),
      ChartBarLayer(

        items: List.generate(
          orderController.orderQuantityListForDashboard.length,
              (index) => ChartBarDataItem(
            x: (index * frequency) + from.millisecondsSinceEpoch,
            value: orderController.orderQuantityListForDashboard[index],
                color: AppColor.primaryColor,
          ),
        ),


        settings: const ChartBarSettings(
          thickness: 20.0,
          radius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    ];
  }
}