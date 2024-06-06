import 'package:get/get.dart';

class FilterByController extends GetxController {
  String? value = '';

  List<String> duration = ['All', 'Annual', 'Perennial', 'Biennial'];
  List<String> cotyledon =  ['All', 'Monocotyledon', 'Dicotyledon'];
  List<String> native =  ['All', 'Native', 'Weed', 'Cultivated'];

  RxInt selectedValue1 = 0.obs;
  RxInt selectedValue2 = 0.obs;
  RxInt selectedValue3 = 0.obs;

  void updateSelectedValue1(int value1) {
    selectedValue1.value = value1;
    update();
  }

  void updateSelectedValue2(int value2) {
    selectedValue2.value = value2;
    update();
  }

  void updateSelectedValue3(int value3) {
    selectedValue3.value = value3;
    update();
  }

  resetValues() {
    selectedValue1.value = 0;
    selectedValue2.value = 0;
    selectedValue3.value = 0;
    update();
  }
}
