import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/constants/colors.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> genders = ['Male', 'Female', 'Other'];
  String selectedGender = 'Male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.sp,
          horizontal: 14.sp,
        ),
        child: ReadMoreButtonWidget(
          bgColor: blueColor,
          text: 'Save',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 50.sp,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: blueColor,
                        size: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.sp),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextInputField(
                    controller: TextEditingController(),
                    text: 'Name',
                    hintText: 'John Doe',
                  ),
                  SizedBox(height: 20.h),
                  TextInputField(
                    controller: TextEditingController(),
                    text: 'Email',
                    hintText: 'john@example.com',
                  ),
                  SizedBox(height: 20.h),
                  TextInputField(
                    controller: TextEditingController(),
                    text: 'Phone number',
                    hintText: '+23481424033',
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: DropdownButtonHideUnderline(
                      // Hide default underline
                      child: DropdownButton<String>(
                        value: selectedGender,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedGender = newValue;
                          }
                        },
                        icon: SizedBox.shrink(),
                        items: genders
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
