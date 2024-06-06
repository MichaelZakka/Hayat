import 'package:get/get.dart';
import 'package:hayat/views/account_page/controller.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/views/hayat_page/controller.dart';
import 'package:hayat/views/home_page/controller.dart';
import 'package:hayat/views/main_page/controller.dart';
import 'package:hayat/views/weather_page/controller.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainPageController());
    //add pages controller in main page
    Get.put(HomePageController());
    Get.put(FeedsController());
    Get.put(HayatController());
    Get.put(WeatherController());
    Get.put(AccountController());
  }
}
