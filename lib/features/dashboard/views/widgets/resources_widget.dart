import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';

class ResourcesWidget extends StatelessWidget {
  final bool isCompleted;
  final bool downloaded;

  const ResourcesWidget({
    super.key,
    this.isCompleted = false,
    this.downloaded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 1,
        child: Container(
          width: double.infinity,
          height: downloaded ? 100.h : 130.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
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
                      'assets/images/hug.png',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Article',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(
                                0xffFF6B00,
                              ),
                            ),
                          ),
                          downloaded
                              ? Container()
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.sp,
                                    vertical: 2.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffA9CBF5),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Free',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: blueColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Financial planning',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      downloaded
                          ? Container()
                          : isCompleted
                              ? Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: greenColor2,
                                  ),
                                )
                              : Container(),
                      SizedBox(height: 10.h),
                      downloaded
                          ? Container()
                          : Row(
                              children: [
                                const Text('4 mins read'),
                                const VerticalDivider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                                isCompleted
                                    ? const Text(
                                        'VIEW CERTIFICATE',
                                        style: TextStyle(
                                          color: blueColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: blueColor,
                                        ),
                                      )
                                    : const Text(
                                        'View details',
                                        style: TextStyle(
                                          color: orangeColor,
                                        ),
                                      )
                              ],
                            ),
                      SizedBox(height: 8.h),
                      downloaded
                          ? Container()
                          : isCompleted
                              ? Container()
                              : SizedBox(
                                  width: double.infinity,
                                  height: 5.h,
                                  child: LinearProgressIndicator(
                                    value: 0.5, // Represents 50% progress
                                    backgroundColor: const Color(0xffA9CBF5),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            blueColor),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                      downloaded
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Downloaded',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
