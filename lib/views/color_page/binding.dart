import 'package:get/get.dart';
import 'package:hayat/views/color_page/controller.dart';

class ColorBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ColorController());
  }
}
