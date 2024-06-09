import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/body/update_user_body.dart';
import 'package:hayat/data/models/response/login_response.dart';
import 'package:hayat/data/repository/account_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/home_page/controller.dart';

class EditAccountController extends GetxController {
  AccountRepo accountRepo = AccountRepo();
  final InitController initController = Get.put(InitController());
  final HomePageController homePageController = Get.put(HomePageController());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
  }

  void test() {
    fullNameController.text = homePageController.userData!.user!.fullName!;
    emailController.text = homePageController.userData!.user!.email!;
    // mobileNumberController.text =
    //     homePageController.userData!.user!.mobileNumber!;
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
        try {
          validation(value.message, green);
          User updated = User(
              createdAt: homePageController.userData!.user!.createdAt,
              email: homePageController.userData!.user!.email,
              id: homePageController.userData!.user!.id,
              isActive: homePageController.userData!.user!.isActive,
              isHidden: homePageController.userData!.user!.isHidden,
              isVerified: homePageController.userData!.user!.isVerified,
              updatedAt: value.data["updated_at"],
              fullName: value.data["full_name"],
              mobileNumber: value.data["mobile_number"]);
          LoginResponse user = LoginResponse(user: updated , token: initController.userData!.token);
          // homePageController.updateUserInfo(fullNameController.text,mobileNumberController.text);
          print(user.user!.fullName);
          AppStorage.saveUserData(user);
          isLoading();
          Get.offAllNamed('/mainPage');
        } catch (e) {
          print(e);
        }
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
