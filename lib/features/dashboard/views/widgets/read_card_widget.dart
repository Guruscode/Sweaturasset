import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class ReadCardWidget extends StatelessWidget {
  final String type;
  final String text;
  final String timeToread;
  final String count;
  final VoidCallback? onTap;
  final String category;

  const ReadCardWidget({
    super.key,
    required this.type,
    required this.text,
    required this.timeToread,
    required this.count,
    this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 257.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.asset(
                    'assets/images/bg.png',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: type == 'Free'
                          ? const Color(0xffA9CBF5)
                          : const Color(0xffFEF9C3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        color: type == 'Free' ? blueColor : orangeColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 16, color: Colors.grey),
                      SizedBox(width: 4.h),
                      Text(
                        timeToread,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 16.h),
                      const Icon(Icons.group, size: 16, color: Colors.grey),
                      SizedBox(width: 4.h),
                      Text(
                        count,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: SizedBox(
                      width: 150.w,
                      height: 30.h,
                      child: ReadMoreButtonWidget(
                        bgColor: blueColor,
                        onPressed: onTap ?? () {},
                        text: 'Read',
                        textColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
