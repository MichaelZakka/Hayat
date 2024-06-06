import 'package:get/get.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class PlatformSignupController extends GetxController {
    void popup() {
      Get.to(
        CustomPopup(
          content: 'Reset password link has been sent to your email address!',
          title: 'Success',
          ontap: () {
            Get.toNamed('/loginPage');
          },
        ),
      );
    }
}
