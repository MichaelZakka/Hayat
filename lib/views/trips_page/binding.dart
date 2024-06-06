import 'package:get/get.dart';
import 'package:hayat/views/trips_page/controller.dart';

class TripsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TripsController());
  }
}
