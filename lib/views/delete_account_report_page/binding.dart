import 'package:get/get.dart';
import 'package:hayat/views/delete_account_report_page/controller.dart';
import 'package:hayat/views/home_page/controller.dart';

class DeleteAccountReportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DeleteAccountReportController());
    Get.put(HomePageController());
  }
}
