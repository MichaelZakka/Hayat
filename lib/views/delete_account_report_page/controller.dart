import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/data/repository/account_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/home_page/controller.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class DeleteAccountReportController extends GetxController {
  RxInt selectedValue = 0.obs;
  AccountRepo accountRepo = AccountRepo();
  TextEditingController reasonController = TextEditingController();
  HomePageController reasons = Get.find();

  deleteAccountRequest(String reason) {
    try {
      accountRepo.deleteAccountRequest().then((value) async {
        if (value.message == 'Your account has been deleted successfully') {
          print(value.message);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: mediumText,
    );
  }

  void popup() {
    Get.to(
      CustomPopup(
        content: 'Are you sure you want to delete your account?.',
        isquestion: true,
        title: 'Delete Account',
        answerontap: () {
          print(reasons.reasons.data![0]);
          deleteAccountRequest(
              selectedValue.value == reasons.reasons.data!.length-1
                  ? reasons.reasons.data![selectedValue.value].reason!
                  : reasonController.text);
          validation('Your account has been deleted successfully', green);

          Get.offAllNamed('/loginPage');
        },
      ),
    );
  }

  void updateSelectedValue(int value) {
    selectedValue.value = value;
    update();
  }
}
