import 'package:get/get.dart';
import 'package:hayat/views/ad_page/controller.dart';

class AdBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(AdPageController());
  }
}