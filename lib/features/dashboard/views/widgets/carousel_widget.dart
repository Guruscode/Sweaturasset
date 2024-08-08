import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/features/dashboard/controllers/ads_controller.dart';
import 'package:shimmer/shimmer.dart';

class CarouselWidget extends StatelessWidget {
  final AdsController adsController;
  const CarouselWidget({
    super.key,
    required this.adsController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: GetBuilder<AdsController>(
        init: adsController,
        builder: (controller) {
          return controller.isLoading
              ? SizedBox(
                  width: double.infinity,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: FlutterCarousel.builder(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        viewportFraction: .8,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        height: 400.0,
                        showIndicator: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                        slideIndicator: const CircularSlideIndicator(),
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index, int_two) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : FlutterCarousel.builder(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    viewportFraction: .8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 400.0,
                    showIndicator: true,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    slideIndicator: const CircularSlideIndicator(),
                  ),
                  itemCount: controller.ads.length,
                  itemBuilder: (context, index, int_two) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          controller.ads.value[index].title ?? '',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
