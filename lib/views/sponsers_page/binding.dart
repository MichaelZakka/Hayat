import 'package:get/get.dart';
import 'package:hayat/views/sponsers_page/controller.dart';

class SponsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SponsersController());
  }
}
