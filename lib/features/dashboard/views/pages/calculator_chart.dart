import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swa/core/constants/colors.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/features/dashboard/controllers/calculator_controller.dart';
import 'package:swa/features/dashboard/views/widgets/estimation_widget.dart';

class CalculatorChart extends StatefulWidget {
  const CalculatorChart({super.key});

  @override
  State<CalculatorChart> createState() => _CalculatorChartState();
}

class _CalculatorChartState extends State<CalculatorChart> {
  final CalculatorController _calculatorController =
      Get.put(CalculatorController());

  final List<Map<String, dynamic>> chartData = [
    {'type': 'Utility', 'color': utiliyColor},
    {'type': 'Bills', 'color': billsColor},
    {'type': 'Household', 'color': householdColor},
    {'type': 'Transportation', 'color': transportationColor},
    {'type': 'Medical', 'color': medicalColor},
    {'type': 'Miscellaneous', 'color': miscellaneousColor},
    {'type': 'Education', 'color': educationColor},
    {'type': 'Contribution', 'color': contributionColor},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Result',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Pie Chart
                    Expanded(
                      flex: 2,
                      child: PieChart(
                        swapAnimationDuration: const Duration(milliseconds: 750),
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .utilPercentage.value
                                  .toStringAsFixed(2)),
                              color: utiliyColor,
                              title:
                                  '${_calculatorController.utilPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .billsPercentage.value
                                  .toStringAsFixed(2)),
                              color: billsColor,
                              title:
                                  '${_calculatorController.billsPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .householdPercentage.value
                                  .toStringAsFixed(2)),
                              color: householdColor,
                              title:
                                  '${_calculatorController.householdPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .transportationPercentage.value
                                  .toStringAsFixed(2)),
                              color: transportationColor,
                              title:
                                  '${_calculatorController.transportationPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .medicalPercentage.value
                                  .toStringAsFixed(2)),
                              color: medicalColor,
                              title:
                                  '${_calculatorController.medicalPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .miscellaneousPercentage.value
                                  .toStringAsFixed(2)),
                              color: miscellaneousColor,
                              title:
                                  '${_calculatorController.miscellaneousPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .educationPercentage.value
                                  .toStringAsFixed(2)),
                              color: educationColor,
                              title:
                                  '${_calculatorController.educationPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                            PieChartSectionData(
                              value: double.parse(_calculatorController
                                  .contributionPercentage.value
                                  .toStringAsFixed(2)),
                              color: contributionColor,
                              title:
                                  '${_calculatorController.contributionPercentage.value.toStringAsFixed(1)}%',
                              titleStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              radius: 60,
                            ),
                          ],
                          centerSpaceRadius: 40,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                    // Legend
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: chartData.map((data) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: data['color'],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  data['type'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EstimationWidget(
                    calculatorController: _calculatorController,
                    text: 'Estimated\nMonthly Cost',
                    cost: 'N${_calculatorController.totalMonthlyCost.toString()}',
                  ),
                  EstimationWidget(
                    calculatorController: _calculatorController,
                    text: 'Estimated\nAnnual Cost',
                    cost: 'N${_calculatorController.totalAnnualCost.toString()}',
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Assuming Zero Inflation',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EstimationWidget(
                    calculatorController: _calculatorController,
                    text: '10 years estimated cost',
                    cost: 'N${_calculatorController.total10YearCost.toString()}',
                  ),
                  EstimationWidget(
                    calculatorController: _calculatorController,
                    text: '20 years estimated cost',
                    cost: 'N${_calculatorController.total20YearCost.toString()}',
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Card(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 years post- Retirement (25% less expenses assuming zero inflation) ',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'N${_calculatorController.totalAnnualCost.toString()}',
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
              ),
              SizedBox(
                height: 10.h,
              ),
              Card(
                color: Color(0xffFEE2E2),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 years post- Retirement (25% less expenses assuming 40% inflation) ',
                          style: TextStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'N${_calculatorController.retirement20YearFortyInflation.toString()}',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                      ],
                    ),
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
