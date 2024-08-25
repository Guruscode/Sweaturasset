import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/features/auth/views/pages/login.dart';

class LogoutController extends GetxController {
  Future logoutUser() async {
    print(box.read('token'));
    try {
      var token = box.read('token');
      var req = await http.post(
        Uri.parse('$apiUrl/logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (req.statusCode == 200) {
        box.erase();
        if (box.read('token') == null) {
          Get.offAll(() => const LoginScreen());
        } else {
          Get.snackbar(
            'Error',
            'Something went wrong',
            backgroundColor: orangeColor,
            colorText: Colors.white,
          );
        }
      } else {
        print(jsonDecode(req.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
