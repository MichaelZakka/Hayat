import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/firebase_api.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/body/login_body.dart';
import 'package:hayat/data/models/response/login_response.dart';
import 'package:hayat/data/repository/auth_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class LoginController extends GetxController {
  AuthRepo authRepo = AuthRepo();
  InitController initController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
  }

  loginWithApple() {
    try {
      authRepo.signupWithApple().then((value) async {
        if (value.status == 200) {
          AppStorage.token = value.data["token"];
          await AppStorage.setAuthState(true);
          await AppStorage.saveToken(value.data["token"]);
          await AppStorage.saveUserData(LoginResponse(
              user: User.fromJson(value.data['user']),
              token: value.data["token"]));
          initController.isAuthenticated = true.obs;

          isLoading();
          Get.offAllNamed('/mainPage');
        }
      });
    } catch (e) {
      print(e);
      validation(e.toString(),red);
    }
  }

  loginWithGoogle() async {
    try {
      authRepo.signInWithGoogle().then((value) async {
        if (value != null) {
          if (value.status == 200) {
            AppStorage.token = value.data["token"];
            await AppStorage.setAuthState(true);
            await AppStorage.saveToken(value.data["token"]);
            print('sssssssssssssssssssssssssssssssssssssssssssss');
            updateTokenRequest(value.data["token"]);
            print('sssssssssssssssssssssssssssssssssssssssssssss');
            await AppStorage.saveUserData(LoginResponse(
                user: User.fromJson(value.data["user"]),
                token: value.data["token"]));
            initController.userData =
                await AppStorage.getUserInfoFromSharedPreferences() ??
                    LoginResponse(token: '');
            initController.isAuthenticated = true.obs;

            isLoading();
            Get.offAllNamed('/mainPage');
          }
        } else {
          isLoading();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  updateTokenRequest(String token) async {
    try {
      authRepo.updateToken(FirebaseApi.fcmToken!, token).then((value) async {
        print("==================================================");
        print(value.message);
      });
    } catch (e) {
      print(e);
    }
  }

  loginRequest() {
    try {
      authRepo
          .login(LoginBody(
              email: emailController.text, password: passwordController.text))
          .then((value) async {
        if (value.message == 'You have logged in successfully') {
          AppStorage.token = value.data["token"];
          await AppStorage.setAuthState(true);
          await AppStorage.saveToken(value.data["token"]);
          print('sssssssssssssssssssssssssssssssssssssssssssss');
          updateTokenRequest(value.data["token"]);
          print('sssssssssssssssssssssssssssssssssssssssssssss');
          await AppStorage.saveUserData(LoginResponse(
              user: User.fromJson(value.data["user"]),
              token: value.data["token"]));
          initController.userData =
              await AppStorage.getUserInfoFromSharedPreferences() ??
                  LoginResponse(token: '');
          print(AppStorage.token);
          initController.isAuthenticated = true.obs;

          isLoading();

          Get.offAllNamed('/mainPage');
        } else {
          isLoading();
          validation(value.message, red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void validation(String message, Color color) {
    if (message == 'the password you entered doesn\'t match out records') {
      message = 'Your password is incorrect';
    }
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
