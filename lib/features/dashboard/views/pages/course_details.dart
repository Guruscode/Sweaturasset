import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/models/courses.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';
import 'package:swa/features/dashboard/views/widgets/section_widget.dart';
import 'package:swa/features/dashboard/views/widgets/video_list_widget.dart';
import 'package:swa/features/dashboard/views/pages/content_page.dart';
import 'package:swa/features/payment/views/payment_screen.dart';

class CourseDetails extends StatefulWidget {
  final CoursesModel model;
  final bool isPaid;

  const CourseDetails({super.key, required this.model, this.isPaid = false});

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
        title: const Text('Course detail'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: const Icon(
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
                    widget.model.name ?? '',
                    style: GoogleFonts.cabin(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  widget.isPaid
                      ? const SizedBox()
                      : Container(
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
                                    'N${widget.model.price.toString()}',
                                    style: TextStyle(
                                      fontSize: 23.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          decoration:
                                              TextDecoration.lineThrough,
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
                                  onPressed: () {
                                    Get.to(
                                      () => PaymentPage(course: widget.model),
                                    );
                                  },
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
                    widget.model.overview ?? '',
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
                            const Icon(
                              Icons.speaker_outlined,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Language: ${widget.model.language?.capitalize}',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.video_library_outlined,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '${widget.model.numberOfLessons} lessons (${widget.model.hours} hours)',
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
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.model.whatYouWillLearn!.length,
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
                                Text(widget.model.whatYouWillLearn?[index] ??
                                    ''),
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.model.curriculums?.length ?? 0,
                    itemBuilder: (context, index) {
                      return widget.model.curriculums!.isEmpty
                          ? const SizedBox(
                              child: Center(
                                child: Text(
                                  'Curriculum content coming soon...',
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: ContentPage(
                                        id: widget.model.curriculums![index].id!
                                            .toInt(),
                                        courseId: widget.model.id!.toInt(),
                                      ),
                                    );
                                  },
                                  child: SectionWidget(
                                    section: widget.model.curriculums![index]
                                            .sectionName ??
                                        '',
                                    title: widget.model.curriculums![index]
                                            .sectionTitle ??
                                        '',
                                    time: '25 min',
                                  ),
                                ),
                                // ListView.builder(
                                //   shrinkWrap: true,
                                //   itemCount: widget.model.curriculums![index]
                                //       .contents!.length,
                                //   itemBuilder: (context, index) {
                                //     print(
                                //         "Length: ${widget.model.curriculums![index].contents![index].title}");
                                //     return widget.model.curriculums![index]
                                //             .contents!.isEmpty
                                //         ? const SizedBox(
                                //             child: Center(
                                //               child: Text(
                                //                 'Section content coming soon...',
                                //               ),
                                //             ),
                                //           )
                                //         : VideoListWidget(
                                //             number: widget
                                //                 .model
                                //                 .curriculums![index]
                                //                 .contents![index]
                                //                 .id
                                //                 .toString(),
                                //             title: widget
                                //                     .model
                                //                     .curriculums![index]
                                //                     .contents![index]
                                //                     .title ??
                                //                 '',
                                //           );
                                //   },
                                // ),
                              ],
                            );
                    },
                  ),
                  SizedBox(
                    height: 20.h,
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
