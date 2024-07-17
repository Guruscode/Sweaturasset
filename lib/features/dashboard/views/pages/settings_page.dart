import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/auth/views/pages/login.dart';
import 'package:swa/features/dashboard/views/pages/change_password.dart';
import 'package:swa/features/dashboard/views/pages/edit_profile.dart';
import 'package:swa/features/dashboard/views/pages/help_and_support.dart';
import 'package:swa/features/dashboard/views/pages/privacy_policy.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';
import 'package:swa/features/dashboard/views/widgets/setting_text_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationSwitch = false;
  bool updatesSwitch = false;

  void _showLogoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.sp,
                            ),
                            side: BorderSide(
                              color: blueColor,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close bottom sheet
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: blueColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Expanded(
                      child: ReadMoreButtonWidget(
                        bgColor: blueColor,
                        text: 'Yes, Log out',
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.white,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 15.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: blueColor,
                ),
              ),
              SizedBox(height: 20.h),
              SettingsTextWidget(
                text: 'Edit Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SettingsTextWidget(
                text: 'Change Password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SettingsTextWidget(
                text: 'Privacy Policy',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              SettingsTextWidget(
                text: 'Help and Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpandSupportPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              Text(
                'Notification',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: blueColor,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    activeColor: Colors.grey.shade300,
                    thumbColor: blueColor,
                    value: notificationSwitch,
                    onChanged: (value) {
                      setState(() {
                        notificationSwitch = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Updates',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Spacer(),
                  CupertinoSwitch(
                    activeColor: Colors.grey.shade300,
                    thumbColor: blueColor,
                    value: updatesSwitch,
                    onChanged: (value) {
                      setState(() {
                        updatesSwitch = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                'Others',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: blueColor,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      'English',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    'Region',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      'Nigeria',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              GestureDetector(
                onTap: _showLogoutBottomSheet, // Show bottom sheet on tap
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
