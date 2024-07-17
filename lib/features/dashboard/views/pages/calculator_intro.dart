import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/auth/views/pages/forgot_password.dart';
import 'package:swa/features/dashboard/views/pages/calculator_main.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class CalculatorIntro extends StatefulWidget {
  const CalculatorIntro({super.key});

  @override
  State<CalculatorIntro> createState() => _CalculatorIntroState();
}

class _CalculatorIntroState extends State<CalculatorIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Calculator'),
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
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.sp,
            horizontal: 15.sp,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Retirement Financial Planning Calculator',
                style: TextStyle(
                  color: blueColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Estimate your current monthly and annual expenses and extrapolate it for your probable expenses at retirement and estimated expenses for 20 years post retirement with and without the factor of inflation',
                style: TextStyle(),
              ),
              SizedBox(height: 40.h),
              Text(
                'Instructions',
                style: TextStyle(
                  color: blueColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Kindly input your estimated cost for each of the expense every month',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'If you have dependants (i.e wife, kids, sibilings) you can add them to the expenses',
                style: TextStyle(),
              ),
              SizedBox(height: 80.h),
              ReadMoreButtonWidget(
                bgColor: blueColor,
                text: 'Continue',
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CalculatorMain(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
