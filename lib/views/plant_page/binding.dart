import 'package:get/get.dart';
import 'package:hayat/views/plant_page/controller.dart';

class PlantBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlantController());
  }
}
