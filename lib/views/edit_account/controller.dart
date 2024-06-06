import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/body/update_user_body.dart';
import 'package:hayat/data/repository/account_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class EditAccountController extends GetxController {
  AccountRepo accountRepo = AccountRepo();
  final InitController initController = Get.put(InitController());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
  }

  void test() {
    fullNameController.text = initController.userData!.user!.fullName!;
    emailController.text = initController.userData!.user!.email!;
    mobileNumberController.text = initController.userData!.user!.mobileNumber!;
  }

  updateUser() {
    accountRepo
        .updateuserRequest(
      UpdateUserBody(
          fullName: fullNameController.text,
          email: emailController.text,
          mobileNumber: mobileNumberController.text),
    )
        .then((value) {
      if (value.message == 'User info updated successfully') {
        initController.userData!.user!.fullName =fullNameController.text;
        initController.userData!.user!.mobileNumber =mobileNumberController.text;
        validation(value.message, green);
        isLoading();
        Get.offAllNamed('/mainPage');
      } else {
        isLoading();
        validation(value.message, red);
      }
    });
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: mediumText,
        timeInSecForIosWeb: 3);
  }
}
