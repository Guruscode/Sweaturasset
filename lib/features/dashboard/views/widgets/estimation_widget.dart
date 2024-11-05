import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/dashboard/controllers/calculator_controller.dart';

class EstimationWidget extends StatelessWidget {
  const EstimationWidget({
    super.key,
    required CalculatorController calculatorController, required this.text, required this.cost,
  }) : _calculatorController = calculatorController;

  final CalculatorController _calculatorController;
  final String text;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150.w,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 5.h,),
              Text(
                cost,
                style: TextStyle(
                  color: blueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}