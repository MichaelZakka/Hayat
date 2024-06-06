import 'package:get/get.dart';
import 'package:hayat/views/signup_page/controller.dart';

class SignupBinding implements Bindings{


  @override
  void dependencies(){
    Get.put(SignupController());
  }
}