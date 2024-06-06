import 'package:get/get.dart';
import 'package:hayat/views/contanct_us_page/controller.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}
