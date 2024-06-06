import 'package:get/get.dart';
import 'package:hayat/views/location_page/controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LocationController());
  }
}
