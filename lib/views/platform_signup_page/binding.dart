import 'package:get/get.dart';
import 'package:hayat/views/platform_signup_page/controller.dart';

class PlatformSignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlatformSignupController());
  }
}
