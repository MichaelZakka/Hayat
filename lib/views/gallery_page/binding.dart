import 'package:get/get.dart';
import 'package:hayat/views/gallery_page/controller.dart';

class GalleryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GalleryController());
  }
}
