import 'package:get/get.dart';
import 'package:hayat/views/splash/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}