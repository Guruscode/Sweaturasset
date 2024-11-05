import 'package:get/get.dart';

class CalculatorController extends GetxController {
  // Your existing variables
  var utilone = ''.obs;
  var utiltwo = ''.obs;
  var utilthree = ''.obs;

  var billsone = ''.obs;
  var billstwo = ''.obs;
  var billsthree = ''.obs;

  var householdone = ''.obs;
  var householdtwo = ''.obs;
  var householdthree = ''.obs;
  var householdfour = ''.obs;

  var groceryone = ''.obs;
  var grocerytwo = ''.obs;

  var educationone = ''.obs;
  var educationtwo = ''.obs;

  var transportation = ''.obs;

  var medical = ''.obs;

  var contributionone = ''.obs;
  var contributiontwo = ''.obs;

  var miscellaneous = ''.obs;

  // Sums for each category
  var sumUtil = 0.0.obs;
  var sumBills = 0.0.obs;
  var sumHousehold = 0.0.obs;
  var sumGrocery = 0.0.obs;
  var sumEducation = 0.0.obs;
  var sumTransportation = 0.0.obs;
  var sumMedical = 0.0.obs;
  var sumContribution = 0.0.obs;
  var sumMiscellaneous = 0.0.obs;

  // Total cost and percentages
  var totalMonthlyCost = 0.0.obs;
  var totalAnnualCost = 0.0.obs;
  var total10YearCost = 0.0.obs;
  var total20YearCost = 0.0.obs;

  var utilPercentage = 0.0.obs;
  var billsPercentage = 0.0.obs;
  var householdPercentage = 0.0.obs;
  var groceryPercentage = 0.0.obs;
  var educationPercentage = 0.0.obs;
  var transportationPercentage = 0.0.obs;
  var medicalPercentage = 0.0.obs;
  var contributionPercentage = 0.0.obs;
  var miscellaneousPercentage = 0.0.obs;

  // Future costs after retirement
  var retirement20YearZeroInflation = 0.0.obs;
  var retirement20YearFortyInflation = 0.0.obs;

  // Update Utility
  void updateUtilOne(String value) {
    utilone.value = value;
    calculateSumUtil();
  }

  void updateUtilTwo(String value) {
    utiltwo.value = value;
    calculateSumUtil();
  }

  void updateUtilThree(String value) {
    utilthree.value = value;
    calculateSumUtil();
  }

  void calculateSumUtil() {
    sumUtil.value = (double.tryParse(utilone.value) ?? 0) +
                    (double.tryParse(utiltwo.value) ?? 0) +
                    (double.tryParse(utilthree.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Bills
  void updateBillOne(String value) {
    billsone.value = value;
    calculateSumBills();
  }

  void updateBillTwo(String value) {
    billstwo.value = value;
    calculateSumBills();
  }

  void updateBillThree(String value) {
    billsthree.value = value;
    calculateSumBills();
  }

  void calculateSumBills() {
    sumBills.value = (double.tryParse(billsone.value) ?? 0) +
                     (double.tryParse(billstwo.value) ?? 0) +
                     (double.tryParse(billsthree.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Household
  void updateHouseholdOne(String value) {
    householdone.value = value;
    calculateSumHousehold();
  }

  void updateHouseholdTwo(String value) {
    householdtwo.value = value;
    calculateSumHousehold();
  }

  void updateHouseholdThree(String value) {
    householdthree.value = value;
    calculateSumHousehold();
  }

  void updateHouseholdFour(String value) {
    householdfour.value = value;
    calculateSumHousehold();
  }

  void calculateSumHousehold() {
    sumHousehold.value = (double.tryParse(householdone.value) ?? 0) +
                         (double.tryParse(householdtwo.value) ?? 0) +
                         (double.tryParse(householdthree.value) ?? 0) +
                         (double.tryParse(householdfour.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Grocery
  void updateGroceryOne(String value) {
    groceryone.value = value;
    calculateSumGrocery();
  }

  void updateGroceryTwo(String value) {
    grocerytwo.value = value;
    calculateSumGrocery();
  }

  void calculateSumGrocery() {
    sumGrocery.value = (double.tryParse(groceryone.value) ?? 0) +
                       (double.tryParse(grocerytwo.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Education
  void updateEducationOne(String value) {
    educationone.value = value;
    calculateSumEducation();
  }

  void updateEducationTwo(String value) {
    educationtwo.value = value;
    calculateSumEducation();
  }

  void calculateSumEducation() {
    sumEducation.value = (double.tryParse(educationone.value) ?? 0) +
                         (double.tryParse(educationtwo.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Transportation
  void updateTransportation(String value) {
    transportation.value = value;
    calculateSumTransportation();
  }

  void calculateSumTransportation() {
    sumTransportation.value = double.tryParse(transportation.value) ?? 0;
    calculateTotalMonthlyCost();
  }

  // Medical
  void updateMedical(String value) {
    medical.value = value;
    calculateSumMedical();
  }

  void calculateSumMedical() {
    sumMedical.value = double.tryParse(medical.value) ?? 0;
    calculateTotalMonthlyCost();
  }

  // Contribution
  void updateContributionOne(String value) {
    contributionone.value = value;
    calculateSumContribution();
  }

  void updateContributionTwo(String value) {
    contributiontwo.value = value;
    calculateSumContribution();
  }

  void calculateSumContribution() {
    sumContribution.value = (double.tryParse(contributionone.value) ?? 0) +
                            (double.tryParse(contributiontwo.value) ?? 0);
    calculateTotalMonthlyCost();
  }

  // Miscellaneous
  void updateMiscellaneous(String value) {
    miscellaneous.value = value;
    calculateSumMiscellaneous();
  }

  void calculateSumMiscellaneous() {
    sumMiscellaneous.value = double.tryParse(miscellaneous.value) ?? 0;
    calculateTotalMonthlyCost();
  }

  // Calculate the total monthly cost
  void calculateTotalMonthlyCost() {
    totalMonthlyCost.value = sumUtil.value +
        sumBills.value +
        sumHousehold.value +
        sumGrocery.value +
        sumEducation.value +
        sumTransportation.value +
        sumMedical.value +
        sumContribution.value +
        sumMiscellaneous.value;

    calculatePercentages();
    calculateAnnualAndFutureCosts();
  }

  // Calculate annual and future costs
  void calculateAnnualAndFutureCosts() {
    totalAnnualCost.value = totalMonthlyCost.value * 12;
    total10YearCost.value = totalAnnualCost.value * 10;
    total20YearCost.value = totalAnnualCost.value * 20;

    // Calculate future costs post-retirement
    retirement20YearZeroInflation.value = total20YearCost.value * 0.75; // 25% less expenses assuming zero inflation
    retirement20YearFortyInflation.value = total20YearCost.value * 0.75 * 1.4; // 25% less expenses assuming 40% inflation
  }

  // Calculate percentages for each category
  void calculatePercentages() {
    if (totalMonthlyCost.value > 0) {
      utilPercentage.value = (sumUtil.value / totalMonthlyCost.value) * 100;
      billsPercentage.value = (sumBills.value / totalMonthlyCost.value) * 100;
      householdPercentage.value = (sumHousehold.value / totalMonthlyCost.value) * 100;
      groceryPercentage.value = (sumGrocery.value / totalMonthlyCost.value) * 100;
      educationPercentage.value = (sumEducation.value / totalMonthlyCost.value) * 100;
      transportationPercentage.value = (sumTransportation.value / totalMonthlyCost.value) * 100;
      medicalPercentage.value = (sumMedical.value / totalMonthlyCost.value) * 100;
      contributionPercentage.value = (sumContribution.value / totalMonthlyCost.value) * 100;
      miscellaneousPercentage.value = (sumMiscellaneous.value / totalMonthlyCost.value) * 100;
    }
  }
}
