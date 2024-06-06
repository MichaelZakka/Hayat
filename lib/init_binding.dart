import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InitController());
  }
}