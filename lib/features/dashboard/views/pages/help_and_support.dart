import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/auth/views/pages/forgot_password.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class HelpandSupportPage extends StatefulWidget {
  const HelpandSupportPage({super.key});

  @override
  State<HelpandSupportPage> createState() => _HelpandSupportPageState();
}

class _HelpandSupportPageState extends State<HelpandSupportPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Help and Support'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'FAQ',
                ),
                Tab(
                  text: 'Contact Us',
                ),
              ],
              labelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        EasyFaq(
                          question: "What is lorem ipsum?",
                          answer:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                          backgroundColor: Colors.white,
                          questionTextStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          borderRadius: BorderRadius.circular(8.sp),
                          collapsedIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: blueColor,
                          ),
                          expandedIcon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        EasyFaq(
                          question: "What is lorem ipsum?",
                          answer:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                          backgroundColor: Colors.white,
                          questionTextStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          borderRadius: BorderRadius.circular(8.sp),
                          collapsedIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: blueColor,
                          ),
                          expandedIcon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        EasyFaq(
                          question: "What is lorem ipsum?",
                          answer:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                          backgroundColor: Colors.white,
                          questionTextStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          borderRadius: BorderRadius.circular(8.sp),
                          collapsedIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: blueColor,
                          ),
                          expandedIcon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        EasyFaq(
                          question: "What is lorem ipsum?",
                          answer:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
                          backgroundColor: Colors.white,
                          questionTextStyle: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          borderRadius: BorderRadius.circular(8.sp),
                          collapsedIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: blueColor,
                          ),
                          expandedIcon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: blueColor,
                            ),
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.sp,
                      horizontal: 20.sp,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Email',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'info@sweatyourasset.ng',
                          style: TextStyle(),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(
                              Icons.phone_outlined,
                              color: blueColor,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Phone number',
                              style: TextStyle(
                                color: blueColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          '+234 80 999 88 273',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
