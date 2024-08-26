import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:http/http.dart' as http;
import 'package:swa/core/models/courses.dart';
import 'package:swa/core/models/user_model.dart';

class UserController extends GetxController {
  bool isLoading = false;
  var user = UserModel().obs;
  var courses = <CoursesModel>[].obs;
  var token = box.read('token');

  void loading() {
    isLoading = !isLoading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
    fetchUserCourses();
  }

  Future getUser() async {
    loading();
    try {
      var request = await http.get(
        Uri.parse('$apiUrl/user-profile'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      var response = jsonDecode(request.body);
      if (request.statusCode != 200) {
        response = response as Map<String, dynamic>;
        print(response);
      }
      var data = jsonDecode(request.body)['user'];
      print(data);
      user.value = UserModel.fromJson(data);
    } catch (e) {
      print(e.toString());
      return Left(AppFailure());
    } finally {
      loading();
    }
  }

  Future<Either<AppFailure, List<CoursesModel>>> fetchUserCourses() async {
    courses.value.clear();
    loading();
    try {
      var request = await http.get(
        Uri.parse('$apiUrl/user/courses'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      var response = jsonDecode(request.body);
      if (request.statusCode != 200) {
        response = response as Map<String, dynamic>;
        print(response);
        return Left(AppFailure(response['errors']));
      }
      print("from my: $response");
      for (final data in response['courses']) {
        print(data);
        courses.value.add(CoursesModel.fromJson(data));
        print("course: ${courses.value}");
      }
      return Right(courses.value);
    } catch (e) {
      print(e.toString());
      return Left(AppFailure());
    } finally {
      loading();
    }
  }

  Future<String> updateProfile({
    required int userId,
    required String fullName,
    required String email,
    required String phoneNumber,
    required DateTime dob,
  }) async {
    loading();
    try {
      print('Hello');
      var request =
          await http.put(Uri.parse('$apiUrl/editProfile/$userId'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      }, body: {
        'name': fullName,
        'phone_number': phoneNumber,
        'date_of_birth': dob.toString(),
      });
      if (request.statusCode == 200) {
        getUser();
        return 'success';
      } else {
        print(json.decode(request.body)['errors']);
        return json.decode(request.body)['errors'].toString();
      }
    } catch (e) {
      print(e.toString());
      return 'error';
    } finally {
      loading();
    }
  }
}
