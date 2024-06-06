import 'package:get/get.dart';
import 'package:hayat/views/add_question_page/controller.dart';

class AddQuestionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddQuestionController());
  }
}
