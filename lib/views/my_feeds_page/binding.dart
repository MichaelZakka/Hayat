import 'package:get/get.dart';
import 'package:hayat/views/my_feeds_page/controller.dart';

class MyFeedsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyFeedsController());
  }
}
