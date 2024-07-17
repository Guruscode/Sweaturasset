import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';

class VideoListWidget extends StatelessWidget {
  final String number;
  final bool isLocked;
  const VideoListWidget({
    super.key,
    required this.number, this.isLocked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightestblueColor,
                border: Border.all(
                  color: blueColor.withOpacity(
                    0.3,
                  ),
                  width: 2,
                ),
              ),
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why Using Graphic De..',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  '15 mins',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            ),
          ],
        ),
        isLocked ? Icon(Icons.lock_outlined) : Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: blueColor,
          ),
          child: Icon(
             Icons.play_arrow_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
