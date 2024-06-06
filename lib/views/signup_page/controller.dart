import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/body/login_body.dart';
import 'package:hayat/data/models/body/signup_body.dart';
import 'package:hayat/data/models/response/login_response.dart';
import 'package:hayat/data/repository/auth_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class SignupController extends GetxController {
  AuthRepo authRepo = AuthRepo();

  RxBool loading = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  InitController initController = Get.find();

  RxBool isAgreed = false.obs;

  void agreeAction(){
    isAgreed.toggle();
    update();
  }

  
  SignupWithGoogle(){
    try{
      authRepo.signInWithGoogle().then((value){
        print(value);
      });
    }catch(e){print(e);}
  }


  isLoading() {
    loading.toggle();
    update();
  }

  signUpRequest() {
    authRepo
        .signup(SignUpBody(
            email: emailController.text,
            fullName: fullNameController.text,
            password: passwordController.text,
            mobileNumber: phoneNumberController.text))
        .then((value) {
      if (value.message == 'User signed up successfully') {
        validation('User signed up successfully', green);
        print(value.message);
        authRepo
            .login(LoginBody(
                email: emailController.text, password: passwordController.text))
            .then((value) async {
          if (value.message == 'You have logged in successfully') {
            AppStorage.token = value.data["token"];
            await AppStorage.saveUserData(LoginResponse(
                user: User.fromJson(value.data["user"]),
                token: value.data["token"]));
            initController.userData =
                await AppStorage.getUserInfoFromSharedPreferences() ??
                    LoginResponse(token: '');
            print(AppStorage.token);

            isLoading();

            Get.offAllNamed('/mainPage');
          }
        });
        isLoading();
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
      timeInSecForIosWeb: 3,
      fontSize: mediumText,
    );
  }
}
