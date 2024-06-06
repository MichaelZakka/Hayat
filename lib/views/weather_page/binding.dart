import 'package:get/get.dart';
import 'package:hayat/views/weather_page/controller.dart';

class WeatherBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(WeatherController());
  }
}