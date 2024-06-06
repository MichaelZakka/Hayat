import 'package:get/get.dart';
import 'package:hayat/views/post_report_page/controller.dart';

class PostReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PostReportController());
  }
}
