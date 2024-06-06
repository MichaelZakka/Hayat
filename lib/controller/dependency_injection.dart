import 'package:get/get.dart';
import 'package:hayat/controller/network_controller.dart';

class NetworkBinding {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
