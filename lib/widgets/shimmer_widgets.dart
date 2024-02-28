import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerForAddressBar extends StatelessWidget {
  const ShimmerForAddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(top: 0),
            //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            height: 60,
            width: ScreenSize.width(context)* 1.00,
          ),
        ),
      ],
    );
  }
}

class ShimmerForPoster extends StatelessWidget {
  const ShimmerForPoster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: const EdgeInsets.only(top: 10),
            //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            height: ScreenSize.height(context)* 0.2,
            width: ScreenSize.width(context)* 0.9,
          ),
        ),
      ],
    );
  }
}



class ShimmerForRetailerList extends StatelessWidget {
  const ShimmerForRetailerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(left: 15,bottom: 10,top: 15),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.015,
                    width: ScreenSize.width(context)* 0.5,
                  ),
                ],
              ),

              ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                //tileColor: AppColor.primaryColor,
                horizontalTitleGap: 10,
                leading: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.15,
                  width: ScreenSize.width(context)* 0.15,
                ),

                title: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.02,
                  width: ScreenSize.width(context)* 0.75,
                ),

                subtitle: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.03,
                  width: ScreenSize.width(context)* 0.75,
                ),

                //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
              ),
              ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                //tileColor: AppColor.primaryColor,
                horizontalTitleGap: 10,

                leading: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.15,
                  width: ScreenSize.width(context)* 0.15,
                ),

                title: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.02,
                  width: ScreenSize.width(context)* 0.75,
                ),

                subtitle: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.03,
                  width: ScreenSize.width(context)* 0.75,
                ),

                //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
              ),
              ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                //tileColor: AppColor.primaryColor,
                horizontalTitleGap: 10,

                leading: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.15,
                  width: ScreenSize.width(context)* 0.15,
                ),

                title: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.02,
                  width: ScreenSize.width(context)* 0.75,
                ),

                subtitle: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.03,
                  width: ScreenSize.width(context)* 0.75,
                ),

                //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
              ),
            ],
          )
        );
  }
}





class ShimmerForProduct extends StatelessWidget {
  const ShimmerForProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
          baseColor: AppColor.greyShimmer,
          highlightColor: AppColor.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                width:ScreenSize.width(context)*0.95,
                height: ScreenSize.height(context)*0.075,
                color: Colors.white,

              ),



              Container(
                margin: EdgeInsets.only(top: 10),
                width:ScreenSize.width(context)*0.95,
                height: ScreenSize.height(context)*0.075,
                color: Colors.white,

              ),

              Container(
                margin: EdgeInsets.only(top: 10),
                width:ScreenSize.width(context)*0.95,
                height: ScreenSize.height(context)*0.075,
                color: Colors.white,

              ),


              Container(
                margin: EdgeInsets.only(top: 10),
                width:ScreenSize.width(context)*0.95,
                height: ScreenSize.height(context)*0.075,
                color: Colors.white,

              ),
            ],
          ),
        );
  }
}



class ShimmerForOrderHistory extends StatelessWidget {
  const ShimmerForOrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColor.greyShimmer,
        highlightColor: AppColor.white,
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(Radius.circular(5)),
            //       ),
            //       margin: const EdgeInsets.only(left: 15,bottom: 10,top: 15),
            //       //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            //       height: ScreenSize.height(context)* 0.015,
            //       width: ScreenSize.width(context)* 0.5,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),

            ///ONE
            Column(
              children: [
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,
                  leading: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.15,
                    width: ScreenSize.width(context)* 0.15,
                  ),

                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,


                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.075,
                  width: ScreenSize.width(context)* 0.95,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            ///TWO
            Column(
              children: [
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,
                  leading: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.15,
                    width: ScreenSize.width(context)* 0.15,
                  ),

                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,


                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.075,
                  width: ScreenSize.width(context)* 0.95,
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            ///THREE
            Column(
              children: [
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,
                  leading: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.15,
                    width: ScreenSize.width(context)* 0.15,
                  ),

                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                  ),
                  //tileColor: AppColor.primaryColor,
                  horizontalTitleGap: 10,


                  title: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 0),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.02,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  subtitle: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    margin: const EdgeInsets.only(top: 10),
                    //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                    height: ScreenSize.height(context)* 0.03,
                    width: ScreenSize.width(context)* 0.75,
                  ),

                  //trailing: IconButton(icon: const Icon(Icons.edit),onPressed: (){},),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  margin: const EdgeInsets.only(top: 0),
                  //padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  height: ScreenSize.height(context)* 0.075,
                  width: ScreenSize.width(context)* 0.95,
                ),
              ],
            ),



          ],
        )
    );
  }
}



