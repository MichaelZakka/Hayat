import 'package:get/get.dart';
import 'package:hayat/views/weather_forecast_page/controller.dart';

class WeatherForecastBinding implements Bindings{


  @override
  void dependencies(){
    Get.put(WeatherForecastController());
  }
}