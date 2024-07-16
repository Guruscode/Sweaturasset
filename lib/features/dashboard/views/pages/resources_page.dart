import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
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

  @override
  void initState() {
    // TODO: implement initState
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
                    ListView(
                      shrinkWrap: true,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CourseDetails(),
                              ),
                            );
                          },
                          child: ResourcesWidget(),
                        ),
                        ResourcesWidget(),
                        ResourcesWidget(),
                        ResourcesWidget(),
                        ResourcesWidget(),
                        ResourcesWidget(),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: const [
                        ResourcesWidget(
                          isCompleted: true,
                        ),
                        ResourcesWidget(
                          isCompleted: true,
                        ),
                        ResourcesWidget(
                          isCompleted: true,
                        ),
                        ResourcesWidget(
                          isCompleted: true,
                        ),
                        ResourcesWidget(
                          isCompleted: true,
                        ),
                      ],
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: const [
                        ResourcesWidget(
                          downloaded: true,
                        ),
                        ResourcesWidget(
                          downloaded: true,
                        ),
                        ResourcesWidget(
                          downloaded: true,
                        ),
                        ResourcesWidget(
                          downloaded: true,
                        ),
                        ResourcesWidget(
                          downloaded: true,
                        ),
                      ],
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
