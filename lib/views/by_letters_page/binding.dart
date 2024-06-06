import 'package:get/get.dart';
import 'package:hayat/views/by_letters_page/controller.dart';

class BylettersBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(ByLettersController());
  }
}