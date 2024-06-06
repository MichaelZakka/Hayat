import 'package:get/get.dart';
import 'package:hayat/views/filter_by_page/controller.dart';

class FilterByBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterByController());
  }
}
