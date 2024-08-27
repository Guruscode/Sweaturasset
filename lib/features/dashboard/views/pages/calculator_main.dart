import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/features/auth/views/pages/forgot_password.dart';
import 'package:swa/features/dashboard/controllers/calculator_controller.dart';
import 'package:swa/features/dashboard/views/widgets/input_field_widget.dart';
import 'package:swa/features/dashboard/views/widgets/read_more_button.dart';

class CalculatorMain extends StatefulWidget {
  const CalculatorMain({super.key});

  @override
  State<CalculatorMain> createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {

  final TextEditingController utilOneController = TextEditingController();
  final TextEditingController utilTwoController = TextEditingController();
  final TextEditingController utilThreeController = TextEditingController();

  final CalculatorController _calculatorController = Get.put(CalculatorController());

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
              SizedBox(height: 30.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 1:Utilities',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(() {
                              return Text(
                                'Total = ${_calculatorController.sumUtil}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: utilOneController,
                        text: 'Electricity/Fuel for generator',
                        hintText: 'N60,000',
                        onChanged: _calculatorController.updateUtilOne,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: utilTwoController,
                        text: 'Water',
                        hintText: 'N60,000',
                        onChanged: _calculatorController.updateUtilTwo,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: utilThreeController,
                        text: 'Trash bill',
                        hintText: 'N60,000',
                        onChanged: _calculatorController.updateUtilThree,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 2:Bills',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N80,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Entertainment/ Cable TV',
                        hintText: 'N10, 000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Phone Credit/Data',
                        hintText: 'N10,000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text:
                            'Mortgage/ Rents/ Tenement tax/Property or Land Taxl',
                        hintText: 'N60,000',
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 3:Household and Personal Care',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total = N100,000',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Toiletries and household consumables',
                        hintText: 'N10, 000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Laundry+Household Cleaning',
                        hintText: 'N10,000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Security',
                        hintText: 'N60,000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Haircut/Hairdo',
                        hintText: 'N20,000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 4:Groceries and Food',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N80,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Food stuff and Groceries',
                        hintText: 'N10, 000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Beverages',
                        hintText: 'N10,000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 5: Education',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N20,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text:
                            'Children School Fees (if you are likely to have children in school at retirement)',
                        hintText: 'N10, 000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Beverages',
                        hintText: 'N10,000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 6: Transportation',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N10,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Transportation/Fuel/Car Maintenance',
                        hintText: 'N10, 000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 7: Medical and Health',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N10,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Medicals/Health Insurance/Medications',
                        hintText: 'N10, 000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 8: Dependants and Contributions',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Total = N20,000',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text:
                            'Dependants and Black Tax(Contribution to extended family welfare)',
                        hintText: 'N10, 000',
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Social and Religious Welfare commitments',
                        hintText: 'N10, 000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category 9: Miscellaneous',
                            style: TextStyle(
                              color: blueColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Total = N10,000',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: TextEditingController(),
                        text: 'Miscellaneous Expenditure',
                        hintText: 'N10, 000',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              ReadMoreButtonWidget(
                bgColor: blueColor,
                text: 'Continue',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
