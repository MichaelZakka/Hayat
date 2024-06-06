import 'package:get/get.dart';
import 'package:hayat/views/account_page/controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}
