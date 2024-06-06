import 'package:get/get.dart';
import 'package:hayat/views/climate_page/controller.dart';

class ClimateBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(ClimateController());
  }
}