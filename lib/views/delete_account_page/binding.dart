import 'package:get/get.dart';
import 'package:hayat/views/delete_account_page/controller.dart';

class DeleteAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DeleteAccountController());
  }
}
