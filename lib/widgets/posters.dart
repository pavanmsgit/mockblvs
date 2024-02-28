import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jiffy_fuels/const/app_colors.dart';
import 'package:jiffy_fuels/const/screen_size.dart';
import 'package:jiffy_fuels/controllers/home_controller.dart';
import 'package:jiffy_fuels/models/posters.dart';
import 'package:shimmer/shimmer.dart';

class PosterCarouselWidget extends StatelessWidget {
  const PosterCarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeController.getAllPosters(),
      builder: (ctx, snapshot) {
        return posterObjects(context);
      },
    );
  }
}

posterObjects(context) {
  List<Posters> posterList = homeController.posters;

  final List<Widget> imageSliders = posterList
      .map(
        (item) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl: item.posterLink,
              width: ScreenSize.width(context),
              fit: BoxFit.fill,

              placeholder: (context, url) => Container(height: 0.001),

              //Shimmer.fromColors(
              //                   baseColor: AppColor.greyShimmer,
              //                   highlightColor: AppColor.grey,
              //                   child: Container(
              //                     width: ScreenSize.width(context),
              //                     height: ScreenSize.height(context) * 0.2,
              //                     color: AppColor.primaryColor,
              //                   ),
              //                 ),

              errorWidget: (context, url, error) => Container(height: 0.001),
            ),
          ),
        ),
      )
      .toList();

  try {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 2500),
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          disableCenter: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
        items: imageSliders,
      ),
    );
  } catch (error) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 2500),
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          disableCenter: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
        ),
        items: imageSliders,
      ),
    );
  }
}
