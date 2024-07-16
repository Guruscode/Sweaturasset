import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final String text;
  final TextEditingController controller;
  final Widget? suffixIcon;

  const TextInputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.text,
    required this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 6.h),
          TextField(
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade200,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(8.sp),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 10.sp,
              ),
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
