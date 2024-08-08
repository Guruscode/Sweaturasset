import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:http/http.dart' as http;
import 'package:swa/core/models/user_model.dart';

class UserController extends GetxController {
  bool isLoading = false;
  var user = UserModel().obs;

  void loading() {
    isLoading = !isLoading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future getUser() async {
    loading();
    try {
      var token = box.read('token');
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
}
