import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';
import 'package:swa/features/dashboard/views/widgets/section_widget.dart';
import 'package:swa/features/dashboard/views/widgets/video_list_widget.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Course detail'),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(.5)),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Financial Planning Course',
                    style: GoogleFonts.cabin(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(13.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightestblueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'N1000',
                              style: TextStyle(
                                fontSize: 23.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '-50%',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  '2000',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey.shade700,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 110.w,
                          child: ReadMoreButtonWidget(
                            bgColor: blueColor,
                            onPressed: () {},
                            text: 'Buy now',
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Overview',
                    style: TextStyle(
                      color: blueColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: blueColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim nisl, adipiscing sed odio rhoncus, etiam auctor aliquam. Semper mi nibh tortor est molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim nisl, adipiscing sed odio rhoncus.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(13.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.speaker_outlined,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'English',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.video_library_outlined,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '07 lessons (1hr 35 min)',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "What you'll learn",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 70.h,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            padding: EdgeInsets.all(10.sp),
                            //width: 100.w,
                            decoration: BoxDecoration(
                              color: lightestYelllowColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.yellow.shade700,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                    'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.')
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Curriculum',
                    style: TextStyle(
                      color: blueColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: blueColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const SectionWidget(
                    section: 'Section 01',
                    title: 'Introduction',
                    time: '25 min',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  VideoListWidget(
                    number: '01',
                    isLocked: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  VideoListWidget(
                    number: '02',
                    isLocked: false,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const SectionWidget(
                    section: 'Section 02',
                    title: 'Graphic design',
                    time: '25 min',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  VideoListWidget(
                    number: '03',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  VideoListWidget(
                    number: '04',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  VideoListWidget(
                    number: '05',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  VideoListWidget(
                    number: '06',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const SectionWidget(
                    section: 'Section 03',
                    title: "Let's practice",
                    time: '25 min',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  VideoListWidget(
                    number: '07',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: blueColor.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  VideoListWidget(
                    number: '08',
                  ),
                  SizedBox(
                    height: 10.h,
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
