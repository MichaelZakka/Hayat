import 'package:get/get.dart';
import 'package:hayat/views/introduction_page/controller.dart';

class IntroductionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(IntroductionController());
  }
}
