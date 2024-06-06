import 'package:get/get.dart';
import 'package:hayat/views/my_questions_page/controller.dart';

class MyQuestionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyQuestionsController());
  }
}
