import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:swa/features/auth/views/pages/otp_page.dart';
import 'package:swa/features/auth/views/pages/password_changed.dart';
import 'package:swa/features/auth/views/widgets/button_widget.dart';
import 'package:swa/features/auth/views/widgets/input_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                height: 20.h,
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
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Please type something you can remember',
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InputFieldWidget(
                      text: 'New Password',
                      controller: TextEditingController(),
                      hintText: '*************',
                      isPassword: true,
                    ),
                    SizedBox(height: 20.h),
                    InputFieldWidget(
                      text: 'Confirm New Password',
                      controller: TextEditingController(),
                      hintText: '*************',
                      isPassword: true,
                    ),
                    SizedBox(height: 20.h),
                    ButtonWidget(
                      text: 'Reset Passsword',
                      textColor: Colors.white,
                      bgColor: blueColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordChanged(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Remember password? ',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            TextSpan(
                              text: 'Log in',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
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
