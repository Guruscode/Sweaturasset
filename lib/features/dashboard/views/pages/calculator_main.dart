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

  final TextEditingController billsOneController = TextEditingController();
  final TextEditingController billsTwoController = TextEditingController();
  final TextEditingController billsThreeController = TextEditingController();

  final TextEditingController houseHoldOneController = TextEditingController();
  final TextEditingController houseHoldTwoController = TextEditingController();
  final TextEditingController houseHoldThreeController = TextEditingController();
  final TextEditingController houseHoldFourController = TextEditingController();

  final TextEditingController groceryOneController = TextEditingController();
  final TextEditingController groceryTwoController = TextEditingController();

  final TextEditingController educationOneController = TextEditingController();
  final TextEditingController educationTwoController = TextEditingController();

  final TextEditingController transportationController = TextEditingController();
  final TextEditingController mediacalTransportation = TextEditingController();

  final TextEditingController contributionOneController = TextEditingController();
  final TextEditingController contributionTwoController = TextEditingController();

  final TextEditingController miscellaneousController = TextEditingController();


  final CalculatorController _calculatorController = Get.put(CalculatorController());

  void ValidateFields() {
    if(utilOneController.text.isEmpty || utilTwoController.text.isEmpty || utilThreeController.text.isEmpty || 
      billsOneController.text.isEmpty || billsTwoController.text.isEmpty || billsThreeController.text.isEmpty ||
      houseHoldOneController.
    ) {

    }
  }

  @override
  void dispose() {
    utilOneController.dispose();
    utilTwoController.dispose();
    utilThreeController.dispose();
    billsOneController.dispose();
    billsTwoController.dispose();
    billsThreeController.dispose();
    houseHoldOneController.dispose();
    houseHoldTwoController.dispose();
    houseHoldThreeController.dispose();
    houseHoldFourController.dispose();
    groceryOneController.dispose();
    groceryTwoController.dispose();
    educationOneController.dispose();
    educationTwoController.dispose();
    transportationController.dispose();
    mediacalTransportation.dispose();
    contributionOneController.dispose();
    contributionTwoController.dispose();
    miscellaneousController.dispose();
    super.dispose();
  }

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
                                'Total = N${_calculatorController.sumUtil}',
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumBills}',
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
                        controller: billsOneController,
                        text: 'Entertainment/ Cable TV',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateBillOne,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: billsTwoController,
                        text: 'Phone Credit/Data',
                        hintText: 'N10,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateBillTwo,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: billsThreeController,
                        text:
                            'Mortgage/ Rents/ Tenement tax/Property or Land Taxl',
                        hintText: 'N60,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updatebillThree,
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
                            child: Obx(() {
                                return Text(
                                  'Total = N ${_calculatorController.sumHousehold}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: houseHoldOneController,
                        text: 'Toiletries and household consumables',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateHouseHoldOne,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: houseHoldTwoController,
                        text: 'Laundry+Household Cleaning',
                        hintText: 'N10,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateHouseHoldTwo,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: houseHoldThreeController,
                        text: 'Security',
                        hintText: 'N60,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateHouseHoldThree,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: houseHoldFourController,
                        text: 'Haircut/Hairdo',
                        hintText: 'N20,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateHouseHoldFour,
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumGrocery}',
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
                        controller: groceryOneController,
                        text: 'Food stuff and Groceries',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateGroceryOne,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: groceryTwoController,
                        text: 'Beverages',
                        hintText: 'N10,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateGroceryTwo,
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumEducation}',
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
                        controller: educationOneController,
                        text:
                            'Children School Fees (if you are likely to have children in school at retirement)',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateEducationOne,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: educationTwoController,
                        text: 'Beverages',
                        hintText: 'N10,000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateEducationTwo,
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumTransportation}',
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
                        controller: transportationController,
                        text: 'Transportation/Fuel/Car Maintenance',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateTransportation,
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumMedical}',
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
                        controller: mediacalTransportation,
                        text: 'Medicals/Health Insurance/Medications',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateMedical,
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
                            child: Obx(() {
                                return Text(
                                  'Total = N${_calculatorController.sumContribution}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: contributionOneController,
                        text:
                            'Dependants and Black Tax(Contribution to extended family welfare)',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateContributionOne,
                      ),
                      SizedBox(height: 20.h),
                      TextInputField(
                        controller: contributionTwoController,
                        text: 'Social and Religious Welfare commitments',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateContributionTwo,
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
                          Obx(() {
                              return Text(
                                'Total = N${_calculatorController.sumMiscellaneous}',
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
                        controller: miscellaneousController,
                        text: 'Miscellaneous Expenditure',
                        hintText: 'N10, 000',
                        keyboardType: TextInputType.number,
                        onChanged: _calculatorController.updateMiscellaneous,
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
                onPressed: () async {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
