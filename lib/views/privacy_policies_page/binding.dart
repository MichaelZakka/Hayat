import 'package:get/get.dart';
import 'package:hayat/views/privacy_policies_page/controller.dart';

class PrivacyPoliciesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivacyPoliciesController());
  }
}
