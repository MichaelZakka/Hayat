import 'package:get/get.dart';
import 'package:hayat/views/home_page/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
