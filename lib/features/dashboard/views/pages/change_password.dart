import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/loading_widget.dart';
import 'package:swa/features/auth/views/pages/forgot_password.dart';
import 'package:swa/features/dashboard/controllers/user_controller.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final UserController _userController = Get.put(UserController());
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.sp,
            horizontal: 14.sp,
          ),
          child: GetBuilder<UserController>(
              init: _userController,
              builder: (controller) {
                return controller.isLoading ?
                const Center(
                  child: LoadingWidget(),
                ):
                ReadMoreButtonWidget(
                  bgColor: blueColor,
                  text: 'Change Password',
                  textColor: Colors.white,
                  onPressed: () async {
                    if(currentPasswordController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
                      Get.snackbar(
                        'Error',
                        'All fields are required',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    if(passwordController.text.trim() != confirmPasswordController.text.trim()) {
                      Get.snackbar(
                        'Error',
                        'Password doesnt match!',
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    var res = await controller.changePassword(
                      currentPassword: currentPasswordController.text.trim(),
                      password: passwordController.text.trim(),
                      confirmPassword: confirmPasswordController.text.trim(),
                    );
                    if(res.toString() == 'success') {
                      Get.snackbar(
                        'Success',
                        'Password updated',
                        backgroundColor: blueColor,
                        colorText: Colors.white,
                      );
                    }else {
                      print(res.toString());
                      Get.snackbar(
                        'Error',
                        res.toString(),
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    }
                  },
                );
              }),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Change Password'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<UserController>(
            init: _userController,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.sp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 23.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInputField(
                          controller: currentPasswordController,
                          text: 'Current password',
                          hintText: '********',
                          isPassword: true,
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: blueColor,
                                decoration: TextDecoration.underline,
                                decorationColor: blueColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextInputField(
                          controller: passwordController,
                          text: 'New Password',
                          hintText: '********',
                          isPassword: true,
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                        SizedBox(height: 20.h),
                        TextInputField(
                          controller: confirmPasswordController,
                          text: 'Confirm new password',
                          hintText: '********',
                          isPassword: true,
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
