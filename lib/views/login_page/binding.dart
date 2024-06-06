import 'package:get/get.dart';
import 'package:hayat/views/color_page/controller.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/views/login_page/controller.dart';
import 'package:hayat/views/my_feeds_page/controller.dart';
import 'package:hayat/views/weather_page/controller.dart';

class LoginBindind implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(ColorController());
    Get.put(FeedsController());
    Get.put(WeatherController());
    Get.put(MyFeedsController());
  }
}
