import 'package:get/get.dart';
import 'package:hayat/views/question_details_page/controller.dart';

class QuestionDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestionDetailsController);
  }
}
