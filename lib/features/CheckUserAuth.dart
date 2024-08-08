import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swa/features/auth/controllers/auth_controller.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:swa/features/dashboard/views/widgets/bottom_bar.dart';

class CheckUserAuth extends StatefulWidget {

  const CheckUserAuth({super.key});

  @override
  State<CheckUserAuth> createState() => _CheckUserAuthState();
}

class _CheckUserAuthState extends State<CheckUserAuth> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(authController.isLoggedIn) {
        return const AppBottomBar();
      }else{
        return const LoginScreen();
      }
    });
  }
}
