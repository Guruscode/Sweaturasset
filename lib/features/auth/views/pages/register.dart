import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/loading_widget.dart';
import 'package:swa/features/auth/controllers/auth_controller.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:swa/features/auth/views/widgets/button_widget.dart';
import 'package:swa/features/auth/views/widgets/input_field_widget.dart';
import 'package:swa/features/auth/views/widgets/social_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: Text(
                  'Sweat Your Asset!',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    InputFieldWidget(
                      text: 'Name',
                      controller: nameController,
                      hintText: 'John Doe',
                    ),
                    SizedBox(height: 20.h),
                    InputFieldWidget(
                      text: 'Email',
                      controller: emailController,
                      hintText: 'email@example.com',
                    ),
                    SizedBox(height: 20.h),
                    InputFieldWidget(
                      isPassword: true,
                      text: 'Password',
                      controller: passwordController,
                      hintText: '************',
                    ),
                    SizedBox(height: 20.h),
                    InputFieldWidget(
                      isPassword: true,
                      text: 'Confirm Password',
                      controller: confirmPasswordController,
                      hintText: '************',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        print('clicked');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GetBuilder<AuthController>(
                        init: authController,
                        builder: (controller) {
                          return controller.isLoading
                              ? const Center(
                                  child: LoadingWidget(),
                                )
                              : ButtonWidget(
                                  text: 'Create an account',
                                  textColor: Colors.white,
                                  bgColor: blueColor,
                                  onPressed: () async {
                                    if (passwordController.text ==
                                        confirmPasswordController.text) {
                                      final result =
                                          await controller.registerUser(
                                        name: nameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                            confirm_password: confirmPasswordController.text.trim()
                                      );

                                      result.fold(
                                        (failure) {
                                          final errorMessages = failure
                                                  .errors?.entries
                                                  .map((e) =>
                                                      '${e.key}: ${e.value.join(', ')}')
                                                  .join('\n') ??
                                              failure.message;
                                          Get.snackbar('Error', errorMessages,
                                              backgroundColor: orangeColor,
                                              colorText: Colors.white);
                                        },
                                        (success) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const LoginScreen(),
                                            ),
                                          );
                                          Get.snackbar(
                                            'Success',
                                            'Account Created, Login!',
                                            backgroundColor: blueColor,
                                            colorText: Colors.white,
                                          );
                                        },
                                      );
                                    } else {
                                      Get.snackbar(
                                          'Error', 'Password doesnt match',
                                          backgroundColor: orangeColor,
                                          colorText: Colors.white);
                                    }
                                  },
                                );
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SocialLoginButtonWidget(
                      image: 'assets/images/Google.png',
                      text: 'Sign in with Google',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SocialLoginButtonWidget(
                      image: 'assets/images/Facebook.png',
                      text: 'Sign in with Facebook',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'By clicking continue, you agree to our ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black38,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // handle tap
                              },
                          ),
                          TextSpan(
                            text: ' and ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black38,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // handle tap
                              },
                          ),
                        ],
                      ),
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
