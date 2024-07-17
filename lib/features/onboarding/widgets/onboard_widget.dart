import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';

class OnBoardWidget extends StatefulWidget {
  final String smallText;
  final String bigText;
  final String brief;
  final bool hasImage;

  const OnBoardWidget(
      {super.key,
      required this.smallText,
      required this.bigText,
      required this.brief,
      this.hasImage = false});

  @override
  State<OnBoardWidget> createState() => _OnBoardWidgetState();
}

class _OnBoardWidgetState extends State<OnBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.smallText,
          style: TextStyle(
            color: orangeColor,
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          widget.bigText,
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.bold,
            fontSize: 23.sp,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          widget.brief,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
          ),
        ),
        if (widget.hasImage) SizedBox(height: 50.h),
        if (widget.hasImage) Image.asset('assets/images/onboard-image.png'),
      ],
    );
  }
}
