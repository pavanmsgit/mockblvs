import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/controllers/order_controller.dart';
import 'package:mrx_charts/mrx_charts.dart';

class PiePage extends StatefulWidget {
  const PiePage({Key? key}) : super(key: key);

  @override
  State<PiePage> createState() => _PiePageState();
}

class _PiePageState extends State<PiePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OrderController(),
      builder: (_) => Scaffold(
        backgroundColor: AppColor.bodyColor,
        body: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 400.0,
              maxWidth: 600.0,
            ),
            padding: const EdgeInsets.all(24.0),
            child:
            orderController.orderQuantityListForDashboard.length != 0 ?  Chart(
              layers: layers(),
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
      ),
    );
  }

  List<ChartLayer> layers() {
    return [
      ChartGroupPieLayer(
        items: List.generate(
          2,
              (index) => List.generate(
                orderController.orderInfoSummaryCount.length,
                (index) => ChartGroupPieDataItem(
                amount:  orderController.orderInfoSummaryCount[index].toDouble(),
                color: [AppColor.green, AppColor.red, AppColor.primaryColor.withOpacity(0.6)][index],
                label: ['COMPLETED', 'CANCELLED','ONGOING'][index]
                ),
          ),
        ),


        settings: const ChartGroupPieSettings(),
      ),

      ChartTooltipLayer(
        shape: () => ChartTooltipPieShape<ChartGroupPieDataItem>(
          onTextName: (item) => item.label,
          onTextValue: (item) => '${item.amount.toInt()} Orders',
          radius: 50.0,

          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(12.0),
          nameTextStyle: const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w700,
            height: 1.47,
            fontSize: 12.0,
          ),
          valueTextStyle: const TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 12.0,
          ),
        ),
      )
    ];
  }
}