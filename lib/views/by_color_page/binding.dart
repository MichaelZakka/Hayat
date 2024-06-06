import 'package:get/get.dart';
import 'package:hayat/views/by_color_page/controller.dart';

class ByColorBindind implements Bindings {
  @override
  void dependencies() {
    Get.put(ByColorController());
  }
}
