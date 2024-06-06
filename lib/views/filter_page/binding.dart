import 'package:get/get.dart';
import 'package:hayat/views/filter_page/controller.dart';

class FilterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterController());
  }
}
