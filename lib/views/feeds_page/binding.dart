import 'package:get/get.dart';
import 'package:hayat/views/feeds_page/controller.dart';

class FeedsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedsController());
  }
}
