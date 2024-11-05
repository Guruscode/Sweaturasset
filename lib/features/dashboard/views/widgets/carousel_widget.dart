import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        viewportFraction: .8,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        height: 400.0,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index, intTwo) {
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
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    viewportFraction: .8,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 400.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  ),
                  itemCount: controller.ads.length,
                  itemBuilder: (context, index, intTwo) {
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
                          textAlign: TextAlign.center,
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
