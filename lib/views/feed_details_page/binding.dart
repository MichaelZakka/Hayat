import 'package:get/get.dart';
import 'package:hayat/views/feed_details_page/controller.dart';

class FeedDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FeedDetailsController());
  }
}
