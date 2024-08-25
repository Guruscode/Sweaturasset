import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/dashboard/controllers/course_controller.dart';
import 'package:swa/features/dashboard/controllers/user_controller.dart';
import 'package:swa/features/dashboard/views/pages/course_details.dart';
import 'package:swa/features/dashboard/views/widgets/resources_widget.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final CourseController courseController = Get.put(CourseController());
  final UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const SizedBox(),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Container(
        //     padding: EdgeInsets.all(5),
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       border: Border.all(
        //         color: Colors.black,
        //       ),
        //     ),
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Colors.black,
        //       size: 18,
        //     ),
        //   ),
        // ),
        title: Text(
          'My Resources',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                    text: 'Ongoing',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                  Tab(
                    text: 'Downloads',
                  ),
                ],
                labelColor: Colors.black,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GetBuilder<UserController>(
                      init: userController,
                      builder: (controller) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.courses.value.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                      () => CourseDetails(
                                    model: controller.courses[index],
                                    isPaid: true,
                                  ),
                                );
                              },
                              child: ResourcesWidget(
                                course: controller.courses[index],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Text('Completed'),
                    ListView(
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
