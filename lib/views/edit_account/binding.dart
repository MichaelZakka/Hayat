import 'package:get/get.dart';
import 'package:hayat/views/edit_account/controller.dart';

class EditAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EditAccountController());
  }
}
