import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class CalculateBannerWidget extends StatelessWidget {
  const CalculateBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          decoration: const BoxDecoration(
            color: yellowColor,
          ),
        ),
        Align(
          alignment: Alignment(1.2, 0.0),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Image.asset(
              'assets/images/calculator.png', // Ensure this path is correct
              scale: 1.4,
            ),
          ),
        ),
        Positioned(
          // bottom: 10.sp,
          left: 13.sp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'your retirement money\nusing personalized\ninformation',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 150.w,
                height: 30.h,
                child: ReadMoreButtonWidget(
                  bgColor: orangeColor,
                  onPressed: () {},
                  text: 'Continue',
                  textColor: Colors.white,
                  roundedSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
