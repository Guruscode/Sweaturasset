import 'package:get/get.dart';

class CalculatorController extends GetxController {

  // Utils

  final utilone = ''.obs;
  final utiltwo = ''.obs;
  final utilthree = ''.obs;

  // Bills

  final billsone = ''.obs;
  final billstwo = ''.obs;
  final billsthree = ''.obs;

  // Household

  final householdone = ''.obs;
  final householdtwo = ''.obs;
  final householdthree = ''.obs;
  final householdfour = ''.obs;

  // Grocery

  final groceryone = ''.obs;
  final grocerytwo = ''.obs;

  // Education

  final educationone = ''.obs;
  final educationtwo = ''.obs;

  // transportation

  final transportation = ''.obs;

  // medical

  final medical = ''.obs;

  // Contribution

  final contributionone = ''.obs;
  final contributiontwo = ''.obs;

  // Miscellaneous

  final miscellaneous = ''.obs;

  final sumUtil = 0.0.obs;
  final sumBills = 0.0.obs;
  final sumHousehold = 0.0.obs;
  final sumGrocery = 0.0.obs;
  final sumEducation = 0.0.obs;
  final sumTransportation = 0.0.obs;
  final sumMedical = 0.0.obs;
  final sumContribution = 0.0.obs;
  final sumMiscellaneous = 0.0.obs;

  void updateUtilOne(String value) {
    utilone.value = value;
    calculateSum();
  }

  void updateUtilTwo(String value) {
    utiltwo.value = value;
    calculateSum(); 
  }

  void updateUtilThree(String value) {
    utilthree.value = value;
    calculateSum();
  }

  void calculateSum() {
    sumUtil.value = (double.tryParse(utilone.value) ?? 0) +
                    (double.tryParse(utiltwo.value) ?? 0) +
                    (double.tryParse(utilthree.value) ?? 0);
  }
  // Bills
  void updateBillOne(String value) {
    billsone.value = value;
    calculateBills();
  }

  void updateBillTwo(String value) {
    billstwo.value = value;
    calculateBills(); 
  }

  void updatebillThree(String value) {
    billsthree.value = value;
    calculateBills();
  }

  void calculateBills() {
    sumBills.value = (double.tryParse(billsone.value) ?? 0) +
                    (double.tryParse(billstwo.value) ?? 0) +
                    (double.tryParse(billsthree.value) ?? 0);
  }

  // HOUSEHOLD
  void updateHouseHoldOne(String value) {
    householdone.value = value;
    calculateHouseHold();
  }

  void updateHouseHoldTwo(String value) {
    householdtwo.value = value;
    calculateHouseHold(); 
  }

  void updateHouseHoldThree(String value) {
    householdthree.value = value;
    calculateHouseHold();
  }

  void updateHouseHoldFour(String value) {
    householdfour.value = value;
    calculateHouseHold();
  }

  void calculateHouseHold() {
    sumHousehold.value = (double.tryParse(householdone.value) ?? 0) +
                    (double.tryParse(householdtwo.value) ?? 0) +
                    (double.tryParse(householdthree.value) ?? 0) +
                    (double.tryParse(householdfour.value) ?? 0);
  }
  

  // Grocery
  void updateGroceryOne(String value) {
    groceryone.value = value;
    calculateGrocery();
  }

  void updateGroceryTwo(String value) {
    grocerytwo.value = value;
    calculateGrocery(); 
  }

  void calculateGrocery() {
    sumGrocery.value = (double.tryParse(groceryone.value) ?? 0) +
                    (double.tryParse(grocerytwo.value) ?? 0);
  }

  // Education
  void updateEducationOne(String value) {
    educationone.value = value;
    calculateEducation();
  }

  void updateEducationTwo(String value) {
    educationtwo.value = value;
    calculateEducation(); 
  }

  void calculateEducation() {
    sumEducation.value = (double.tryParse(educationone.value) ?? 0) +
                    (double.tryParse(educationtwo.value) ?? 0);
  }

  // Transportation
  void updateTransportation(String value) {
    transportation.value = value;
    calculateTransportation();
  }

  void calculateTransportation() {
    sumTransportation.value = (double.tryParse(transportation.value) ?? 0);
  }

  // Medical
  void updateMedical(String value) {
    medical.value = value;
    calculateMedical();
  }

  void calculateMedical() {
    sumMedical.value = (double.tryParse(medical.value) ?? 0);
  }

  // Contribution
  void updateContributionOne(String value) {
    contributionone.value = value;
    calculateContribution();
  }

  void updateContributionTwo(String value) {
    contributiontwo.value = value;
    calculateContribution(); 
  }

  void calculateContribution() {
    sumContribution.value = (double.tryParse(contributionone.value) ?? 0) +
                    (double.tryParse(contributiontwo.value) ?? 0);
  }

  // Medical
  void updateMiscellaneous(String value) {
    miscellaneous.value = value;
    calculateMiscellaneous();
  }

  void calculateMiscellaneous() {
    sumMiscellaneous.value = (double.tryParse(miscellaneous.value) ?? 0);
  }
}
