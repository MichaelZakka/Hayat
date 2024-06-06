import 'package:get/get.dart';
import 'package:hayat/views/forgot_password_page/controller.dart';

class ForgotpasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForgotpasswordController());
  }
}
