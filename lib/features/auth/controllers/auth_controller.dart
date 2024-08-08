import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:swa/core/models/user.dart';

class AuthController extends GetxController {
  bool isLoading = false;

  final _isLoggedIn = false.obs;
  final _token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadToken();
  }

  void loading() {
    isLoading =!isLoading;
    update();
  }
  
  bool get isLoggedIn => _isLoggedIn.value;
  String get token => _token.value;

  Future<void> _loadToken() async {
    String? storedToken = box.read('token');
    if (storedToken != null && storedToken.isNotEmpty) {
      _token.value = storedToken;
      _isLoggedIn.value = true;
    }
  }

  Future<Either<AppFailure, User>> loginUser({
    required String email,
    required String password,
}) async {
    loading();
    try {
      final request = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
         'email' : email,
         'password': password,
        },
      );
      final response = jsonDecode(request.body) as Map<String, dynamic>;
      if(response['status'] != true) {
        print(response);
        return Left(AppFailure(response['error'] ?? 'Failed to login', response['errors']));
      }
      print(response['access_token']);
      await box.write('token', response['access_token']);
      return Right(User.fromJson(response['user']));
    }catch(e) {
      print(e.toString());
      return Left(AppFailure(e.toString()));
    }finally {
      loading();
    }
  }

  Future<Either<AppFailure, User>> registerUser({
    required String name,
    required String email,
    required String password,
    required String confirm_password,
  }) async {
    loading();
    try {
      final request = await http.post(
        Uri.parse('$apiUrl/register'),
        headers: {
          'Accept': 'application/json'
        },
        body: {
          'name' : name,
          'email' : email,
          'password': password,
          'password_confirmation': confirm_password,
        },
      );
      final response = jsonDecode(request.body) as Map<String, dynamic>;
      if(response['status'] != true) {
        print(response);
        return Left(AppFailure(response['error'] ?? 'Failed to register user', response['errors']));
      }
      return Right(User.fromJson(response['user']));
    }catch(e) {
      print(e.toString());
      return Left(AppFailure(e.toString()));
    }finally {
      loading();
    }
  }
}