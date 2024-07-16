import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/dashboard/views/widgets/calculate_banner_widget.dart';
import 'package:swa/features/dashboard/views/widgets/carousel_widget.dart';
import 'package:swa/features/dashboard/views/widgets/circle_button_widget.dart';
import 'package:swa/features/dashboard/views/widgets/quick_pick_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_card_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List chipTypes = [
    [
      "All",
      true,
    ],
    [
      "Paid",
      false,
    ],
    [
      "Articles",
      false,
    ],
    [
      "Free",
      false,
    ],
    [
      "Courses",
      false,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleButtonIconWidget(
                    onTap: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30.sp,
                    ),
                  ),
                  Row(
                    children: [
                      CircleButtonIconWidget(
                        onTap: () {},
                        icon: Icon(
                          CupertinoIcons.search,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      CircleButtonIconWidget(
                        onTap: () {},
                        icon: Icon(
                          Icons.notifications_outlined,
                          color: Colors.black,
                          size: 30.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'Advertisement',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: CarouselWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: chipTypes.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 9.0),
                                  child: Chip(
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    backgroundColor: chipTypes[index][1]
                                        ? blueColor
                                        : Colors.grey.shade100,
                                    label: Text(
                                      chipTypes[index][0],
                                      style: TextStyle(
                                        color: chipTypes[index][1]
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'Most Read',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: SizedBox(
                            height: 300.h,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                ReadCardWidget(
                                  onTap: () {},
                                  category: 'Article',
                                  text: 'How to grow your pension',
                                  type: 'Free',
                                  timeToread: '10-15 mins',
                                  count: '1000 read',
                                ),
                                ReadCardWidget(
                                  onTap: () {},
                                  category: 'Certification',
                                  text: 'Financial Planning',
                                  type: 'N1000',
                                  timeToread: '10-15 mins',
                                  count: '1000 read',
                                ),
                                ReadCardWidget(
                                  onTap: () {},
                                  category: 'Article',
                                  text: 'How to grow your pension',
                                  type: 'Free',
                                  timeToread: '10-15 mins',
                                  count: '1000 read',
                                ),
                                ReadCardWidget(
                                  onTap: () {},
                                  category: 'Certification',
                                  text: 'Financial Planning',
                                  type: 'N1000',
                                  timeToread: '10-15 mins',
                                  count: '1000 read',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        CalculateBannerWidget(),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Qick Pick',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const QuickPickWidget(),
                              SizedBox(
                                height: 10.h,
                              ),
                              const QuickPickWidget(),
                              SizedBox(
                                height: 10.h,
                              ),
                              const QuickPickWidget(),
                              SizedBox(
                                height: 10.h,
                              ),
                              const QuickPickWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
