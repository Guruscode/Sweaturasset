import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final String text;
  final TextEditingController? controller;
  final bool isPassword;

  const InputFieldWidget({
    super.key,
    required this.hintText,
    required this.text,
    this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: inputTextColor.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: hintTextColor,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
