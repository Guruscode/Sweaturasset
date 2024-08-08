import 'dart:convert';

import 'package:get/get.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:swa/core/models/courses.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class CourseController extends GetxController {
  bool isLoading = false;
  var courses = <CoursesModel>[].obs;

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
      for (final data in response) {
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
}
