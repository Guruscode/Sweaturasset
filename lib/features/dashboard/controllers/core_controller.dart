import 'package:get/get.dart';

class CoreController extends GetxController {
  RxString selectedType = ''.obs;

  @override
  void onInit() {
    selectedType.value = 'All';
    super.onInit();
  }

  void onChangeType(selected) {
    selectedType.value = selected;
    update();
  }
}