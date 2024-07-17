import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:swa/features/onboarding/widgets/onboard_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController(viewportFraction: 1.0, keepPage: true);
  String buttonText = 'Next';

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.page!.round() == 2) {
        setState(() {
          buttonText = 'Get Started';
        });
      } else {
        setState(() {
          buttonText = 'Next';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            // Add other widgets here if needed, e.g., a title, subtitle, etc.
            Flexible(
              child: PageView(
                controller: controller,
                children: const [
                  OnBoardWidget(
                    smallText: 'Retirement Planning',
                    bigText: 'Start Smart',
                    brief:
                        'Learn basic concepts and understand the importance of planning with engaging info-graphics and articles.',
                  ),
                  OnBoardWidget(
                    smallText: 'Financial Planning',
                    bigText: 'Stress Free',
                    brief:
                        'Take control of your financial future with our expert guides and savings calculators. Plan effectively for a stress-free retirement.',
                  ),
                  OnBoardWidget(
                    hasImage: true,
                    smallText: 'Lifestyle and Healthcare Planning',
                    bigText: 'Live wealthy, live healthy',
                    brief:
                        'Explore lifestyle adjustments, travel plans, hobbies, healthcare options, and costs. Use our tools to plan a well-rounded retirement lifestyle.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: blueColor,
                      dotColor: greyColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonBgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (controller.page == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LoginScreen();
                            },
                          ),
                        );
                      }
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 13.sp, color: Colors.white),
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
