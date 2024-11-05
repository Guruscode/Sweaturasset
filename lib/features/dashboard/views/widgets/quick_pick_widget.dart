import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/models/courses.dart';
import 'package:swa/features/dashboard/views/pages/course_details.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class QuickPickWidget extends StatelessWidget {
  final CoursesModel? model;
  final VoidCallback? onTap;
  final bool? showPay;

  const QuickPickWidget({
    super.key,
    this.model,
    this.onTap,
    this.showPay = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CourseDetails(model: model!),
        );
      },
      child: Container(
        width: double.infinity,
        height: 130.h,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.04),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 130.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/money.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Article',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      model?.name ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Flexible(
                      child: Text(
                        model?.overview ?? '',
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'N ${model?.price.toString()}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: orangeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        showPay == true
                            ? SizedBox(
                                height: 30.h,
                                width: 80.w,
                                child: ReadMoreButtonWidget(
                                  bgColor: blueColor,
                                  onPressed: onTap ?? () {},
                                  text: 'Pay',
                                  textColor: Colors.white,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
