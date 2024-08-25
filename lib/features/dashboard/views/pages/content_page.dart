import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/loading_widget.dart';
import 'package:swa/features/dashboard/controllers/course_controller.dart';
import 'package:swa/features/dashboard/views/pages/single_page.dart';

class ContentPage extends StatefulWidget {
  final int id;
  final courseId;

  const ContentPage({super.key, required this.id, this.courseId});

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final CourseController courseController = Get.put(CourseController());

  @override
  void initState() {
    super.initState();
    courseController.fetchContent(widget.id, widget.courseId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Available Contents'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Obx(() {
        if (courseController.isLoadingContent.value) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (courseController.content.isEmpty) {
          return const Center(child: Text('No available content yet'));
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            itemCount: courseController.content.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => SinglePage(
                        content: courseController.content[index],
                      ),
                    );
                  },
                  child: ListTile(
                    tileColor: blueColor,
                    title: Text(
                      courseController.content[index].title ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
