import 'package:get/get.dart';
import 'package:hayat/views/our_team_page/controller.dart';

class OurTeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OurTeamController());
  }
}
