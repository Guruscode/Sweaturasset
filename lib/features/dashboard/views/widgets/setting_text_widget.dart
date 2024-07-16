import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTextWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const SettingsTextWidget({
    super.key, required this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: 14.sp),
      ),
    );
  }
}
