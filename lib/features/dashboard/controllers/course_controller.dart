import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:swa/core/models/content_model.dart';
import 'package:swa/core/models/courses.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:swa/features/dashboard/views/widgets/bottom_bar.dart';

class CourseController extends GetxController {
  bool isLoading = false;
  var isLoadingContent = false.obs;
  var courses = <CoursesModel>[].obs;
  var content = <ContentModel>[].obs;
  var token = box.read('token');

  void loading() {
    isLoading = !isLoading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<Either<AppFailure, List<CoursesModel>>> fetchCourses() async {
    courses.value.clear();
    loading();
    try {
      var request = await http.get(Uri.parse('$endpointUrl/courses'));
      var response = jsonDecode(request.body);
      if (request.statusCode != 200) {
        response = response as Map<String, dynamic>;
        print(response);
        return Left(AppFailure(response['errors']));
      }
      print(response);
      for (final data in response['courses']) {
        print(data);
        courses.value.add(CoursesModel.fromJson(data));
        // print(courses.value);
      }
      return Right(courses.value);
    } catch (e) {
      print(e.toString());
      return Left(AppFailure());
    } finally {
      loading();
    }
  }

  Future<Either<AppFailure, List<ContentModel>>> fetchContent(id, courseid) async {
  try {
    content.value.clear();
    isLoadingContent.value = true;
    var request = await http.get(
      Uri.parse('$apiUrl/contents/$id/$courseid'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    var response = jsonDecode(request.body);
    if (request.statusCode != 200) {
      response = response as Map<String, dynamic>;
      print(response);
      Get.snackbar('Error', response['message'], backgroundColor: Colors.red, colorText: Colors.white,);
      Get.offAll(() => const AppBottomBar());
      return Left(AppFailure(response['errors']));
    } else {
      print(response);
      for (final data in response['contents']) {
        print(data);
        content.value.add(ContentModel.fromJson(data));
      }
      return Right(content.value);
    }
  } catch (e) {
    print(e.toString());
    return Left(AppFailure());
  } finally {
    // Ensure that the loading flag is reset regardless of what happens
    isLoadingContent.value = false;
  }
}

}
