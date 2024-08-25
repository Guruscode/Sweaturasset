import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:swa/features/dashboard/controllers/ads_controller.dart';
import 'package:swa/features/dashboard/controllers/article_controller.dart';
import 'package:swa/features/dashboard/controllers/core_controller.dart';
import 'package:swa/features/dashboard/controllers/course_controller.dart';
import 'package:swa/features/dashboard/controllers/user_controller.dart';
import 'package:swa/features/dashboard/views/pages/article_page.dart';
import 'package:swa/features/dashboard/views/pages/calculator_intro.dart';
import 'package:swa/features/dashboard/views/pages/resources_page.dart';
import 'package:swa/features/dashboard/views/pages/settings_page.dart';
import 'package:swa/features/dashboard/views/widgets/bottom_bar.dart';
import 'package:swa/features/dashboard/views/widgets/calculate_banner_widget.dart';
import 'package:swa/features/dashboard/views/widgets/carousel_widget.dart';
import 'package:swa/features/dashboard/views/widgets/quick_pick_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_card_widget.dart';
import 'package:swa/features/payment/views/payment_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final AdsController adsController = Get.put(AdsController());
  final ArticleController articleController = Get.put(ArticleController());
  final CourseController courseController = Get.put(CourseController());
  final CoreController coreController = Get.put(CoreController());
  final UserController userController = Get.put(UserController());

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
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.search,
                  color: Colors.black,
                  size: 25.sp,
                ),
                SizedBox(width: 10.w),
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 25.sp,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<UserController>(
                init: userController,
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(controller.user.value.name ?? ''),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const HomePage(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/home.png',
                              scale: 1.7,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'Home',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const ResourcesPage(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/book.png',
                              scale: 1.7,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'My resources',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const CalculatorIntro(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/calculator.png',
                              scale: 1.7,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'Calculator',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const SettingsPage(),
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/setting.png',
                              scale: 1.7,
                              color: blueColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'Settings',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            adsController.fetchAds();
            courseController.fetchCourses();
            articleController.fetchArticles();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: CarouselWidget(
                              adsController: adsController,
                            ),
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
                                    child: GetBuilder<CoreController>(
                                        init: coreController,
                                        builder: (controller) {
                                          return GestureDetector(
                                            onTap: () =>
                                                controller.onChangeType(
                                                    chipTypes[index][0]),
                                            child: Chip(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                              ),
                                              backgroundColor: controller
                                                          .selectedType.value ==
                                                      chipTypes[index][0]
                                                  ? blueColor
                                                  : Colors.grey.shade100,
                                              label: Text(
                                                chipTypes[index][0],
                                                style: TextStyle(
                                                  color: controller.selectedType
                                                              .value ==
                                                          chipTypes[index][0]
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
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
                              height: 350.h,
                              child: GetBuilder<ArticleController>(
                                  init: articleController,
                                  builder: (controller) {
                                    final articles =
                                        controller.articles.take(4).toList();
                                    return controller.isLoading
                                        ? SizedBox(
                                            width: 200.0,
                                            height: 100.0,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.white,
                                              highlightColor: Colors.grey,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return ReadCardWidget(
                                                    onTap: () {},
                                                    category: '',
                                                    text: '',
                                                    type: '',
                                                    timeToread: '',
                                                    count: '',
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: articles.length,
                                            itemBuilder: (context, index) {
                                              return ReadCardWidget(
                                                onTap: () {
                                                  PersistentNavBarNavigator
                                                      .pushNewScreen(
                                                    context,
                                                    screen: ArticlePage(
                                                      article: controller
                                                          .articles
                                                          .value[index],
                                                    ),
                                                  );
                                                },
                                                category: 'Article',
                                                text: controller.articles
                                                        .value[index].title ??
                                                    '',
                                                type: 'Free',
                                                timeToread: '10-15 mins',
                                                count: '1000 read',
                                              );
                                            },
                                          );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CalculateBannerWidget(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const CalculatorIntro(),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
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
                                GetBuilder<CourseController>(
                                  init: courseController,
                                  builder: (controller) {
                                    return controller.isLoading
                                        ? SizedBox(
                                            width: double.infinity,
                                            height: 100.0,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.white,
                                              highlightColor: Colors.grey,
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: 10,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: QuickPickWidget(
                                                      onTap: () {},
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                controller.courses.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: QuickPickWidget(
                                                  model: controller
                                                      .courses.value[index],
                                                  onTap: () {
                                                    PersistentNavBarNavigator
                                                        .pushNewScreen(
                                                      context,
                                                      screen: PaymentPage(
                                                        course: controller
                                                            .courses
                                                            .value[index],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                  },
                                ),
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
      ),
    );
  }
}
