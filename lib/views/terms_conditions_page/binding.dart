import 'package:get/get.dart';
import 'package:hayat/views/terms_conditions_page/controller.dart';

class TermsConditionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TermsConditionsController());
  }
}
