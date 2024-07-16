import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReadMoreButtonWidget extends StatelessWidget {
  final Color bgColor;
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final double? roundedSize;

  const ReadMoreButtonWidget({
    super.key,
    required this.bgColor,
    required this.onPressed,
    required this.text,
    required this.textColor,
    this.roundedSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedSize ?? 10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
