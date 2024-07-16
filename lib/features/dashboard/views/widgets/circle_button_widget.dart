import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButtonIconWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final int? pSize;
  const CircleButtonIconWidget({
    super.key,
    required this.icon,
    required this.onTap,
    this.pSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(pSize?.sp ?? 10.sp),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.withOpacity(.2),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
