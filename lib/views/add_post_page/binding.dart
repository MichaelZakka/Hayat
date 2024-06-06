import 'package:get/get.dart';
import 'package:hayat/views/add_post_page/controller.dart';
import 'package:hayat/views/feeds_page/controller.dart';

class AddPostBinding implements Bindings{
  @override
  void dependencies (){
    Get.put(AddPostController());
    Get.put(FeedsController());
  }
}