import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/loading_widget.dart';
import 'package:swa/features/dashboard/controllers/user_controller.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime? _selectedDate;

  final UserController _userController = Get.put(UserController());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    fullNameController.text = _userController.user.value.name ?? '';
    emailController.text = _userController.user.value.email ?? '';
    phoneNumberController.text = _userController.user.value.phoneNumber ?? '';
    _selectedDate = _userController.user.value.dateOfBirth?.toLocal();
    super.initState();
  }

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
                text: 'Save',
                textColor: Colors.white,
                onPressed: () async {
                  if (fullNameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      phoneNumberController.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'All fields are required',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar(
                      'Error',
                      'Invalid Email Address',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  var res = await controller.updateProfile(
                    userId: controller.user.value.id!.toInt(),
                    fullName: fullNameController.text.trim(),
                    email: emailController.text.trim(),
                    phoneNumber: phoneNumberController.text.trim(),
                    dob: _selectedDate!.toLocal(),
                  );

                  if(res.toString() == 'success') {
                    Get.snackbar(
                      'Success',
                      'Profile updated successfully',
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
            },
          ),
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
        child: GetBuilder<UserController>(
            init: _userController,
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : Column(
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
                                controller: fullNameController,
                                text: 'Full name',
                                hintText: 'John Doe',
                              ),
                              SizedBox(height: 20.h),
                              TextInputField(
                                controller: emailController,
                                text: 'Email',
                                hintText: 'john@example.com',
                              ),
                              SizedBox(height: 20.h),
                              TextInputField(
                                controller: phoneNumberController,
                                text: 'Phone number',
                                hintText: '+23481424033',
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                'Date of Birth',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () => _selectDate(context),
                                child: Container(
                                  width: double.infinity,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _selectedDate != null
                                          ? '${_selectedDate!.toLocal()}'
                                              .split(' ')[0]
                                          : 'No date selected!',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
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
