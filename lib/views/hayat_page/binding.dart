import 'package:get/get.dart';
import 'package:hayat/views/hayat_page/controller.dart';

class HayatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HayatController());
  }
}
