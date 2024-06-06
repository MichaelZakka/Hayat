import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/app_storage.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/login_page/controller.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';
import 'package:hayat/widgets/buttons/platform_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (_) {
        return SafeArea(
            child: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND2,
              fit: BoxFit.cover,
              width: Get.width,
            ),
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.65,
                    ),
                    SizedBox(
                      width: Get.width * 0.253,
                      child: SvgPicture.asset(FLOWER_LOGO),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: Get.width * 0.86,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: MediaQuery.of(context).size.width > 450
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.237,
                      ),
                      Text('Signin', style: titles),
                      Text(
                        'to your account',
                        style: subtitles,
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email*',
                            style: consttext,
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          AuthTextfield(
                            height: 50.r,
                            obsecurity: false,
                            textEditingController:
                                _loginController.emailController,
                            textInputType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.0268,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password*',
                          style: consttext,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.012,
                      ),
                      AuthTextfield(
                        height: 50.r,
                        obsecurity: true,
                        textEditingController:
                            _loginController.passwordController,
                      ),
                      SizedBox(
                        height: Get.height * 0.019,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/forgotpasswordPage');
                            },
                            child: Text(
                              'Forgot YOUR PASSWORD ?',
                              style: consttext,
                            )),
                      ),
                      SizedBox(
                        height: Get.height * 0.016,
                      ),
                      AuthButton(
                        width: double.infinity,
                        containercolor: yellow,
                        textcolor: Colors.black,
                        text: 'LOGIN',
                        ontap: () async {
                          if (_loginController.emailController.text.isEmpty) {
                            _loginController.validation(
                                'Email cannot be empty', red);
                          } else if (_loginController
                              .passwordController.text.isEmpty) {
                            _loginController.validation(
                                'Password cannot be empty', red);
                          } else {
                            try {
                              _.isLoading();
                              _.loginRequest();
                            } catch (e) {
                              print(e);
                            }
                          }
                          print(AppStorage.token);
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.028,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Login with',
                            style: mediumtext,
                          )),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                       AuthPlatformButton(
                        ontap: (){
                          _.loginWithApple();
                        },
                          icon: APPLE_ICON,
                          containercolor: Colors.black,
                          textcolor: Colors.white,
                          text: '     Continue With Apple',
                          route: '/'),
                      SizedBox(
                        height: Get.height * 0.021,
                      ),
                      AuthPlatformButton(
                          ontap: () async {
                            _.loginWithGoogle();

                          },
                          icon: GOOGLE_ICON,
                          containercolor: Colors.white,
                          textcolor: Colors.black,
                          text: '     Continue With Google',
                          route: '/'),
                      SizedBox(
                        height: Get.height * 0.035,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Don\'t have an account!',
                          style: mediumtext,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const AuthButton(
                          width: double.infinity,
                          containercolor: Color.fromRGBO(41, 104, 150, 1),
                          textcolor: Colors.white,
                          text: 'SIGNUP',
                          route: '/signupPage'),
                      SizedBox(
                        height: Get.height * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            ),
            _loginController.loading.value
                ? Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
      }),
    );
  }
}
