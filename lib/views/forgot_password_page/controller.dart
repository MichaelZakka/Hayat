import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class ForgotpasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  void popup() {
    Get.to(
      CustomPopup(
        content: 'Reset password link has been sent to your email address!',
        isquestion: false,
        title: 'Success',
        ontap: () {
          // Get.toNamed('/loginPage');
        },
      ),
    );
  }

  void validation(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: red,
      textColor: Colors.white,
      fontSize: mediumText,
    );
  }
}
