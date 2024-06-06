import 'package:get/get.dart';
import 'package:hayat/views/trip_page/controller.dart';

class TripBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TripController());
  }
}
