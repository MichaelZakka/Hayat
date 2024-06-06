import 'package:get/get.dart';
import 'package:hayat/views/post_page/controller.dart';

class PostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PostController());
  }
}
