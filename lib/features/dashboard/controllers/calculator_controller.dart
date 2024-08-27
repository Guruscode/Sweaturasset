import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final utilone = ''.obs;
  final utiltwo = ''.obs;
  final utilthree = ''.obs;

  final sumUtil = 0.0.obs;

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
}
