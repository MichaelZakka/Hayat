import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/login_page/controller.dart';
import 'package:hayat/views/signup_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/platform_button.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (_) {
        return Stack(
          children: [
            SizedBox(
              height: Get.height,
              child: SvgPicture.asset(
                BLUE_BACKGROUND3,
                width: Get.width,
                fit: BoxFit.cover,
              ),
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
                    SvgPicture.asset(
                      FLOWER_LOGO,
                      width: Get.width * 0.253,
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: Get.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomAppBar(
                        title: 'Signup',
                      ),
                      Center(
                        child: SizedBox(
                          width: Get.width * 0.86,
                          child: Column(
                            crossAxisAlignment:
                                MediaQuery.of(context).size.width > 450
                                    ? CrossAxisAlignment.center
                                    : CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.13,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Create',
                                  style: titles,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'New Account',
                                  style: subtitles,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.031),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Full Name*',
                                  style: consttext,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.013),
                              AuthTextfield(
                                obsecurity: false,
                                textEditingController: _.fullNameController,
                              ),
                              SizedBox(height: Get.height * 0.027),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email*',
                                  style: consttext,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.013),
                              AuthTextfield(
                                obsecurity: false,
                                textEditingController: _.emailController,
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: Get.height * 0.027),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Text('Mobile Number*', style: consttext)),
                              SizedBox(height: Get.height * 0.013),
                              AuthTextfield(
                                obsecurity: false,
                                textEditingController: _.phoneNumberController,
                                textInputType: TextInputType.phone,
                                hintText: '+965 xxxx xxxx',
                              ),
                              SizedBox(height: Get.height * 0.027),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Password*', style: consttext)),
                              SizedBox(height: Get.height * 0.013),
                              AuthTextfield(
                                obsecurity: true,
                                textEditingController: _.passwordController,
                              ),
                              SizedBox(height: Get.height * 0.022),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        shape: CircleBorder(),
                                        activeColor: blue1,
                                        value: _.isAgreed.value,
                                        onChanged: (value) {
                                          _.agreeAction();
                                        },
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Agreement to ',
                                            style: smalltext1,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  '/termsconditionsPage');
                                            },
                                            child: Text(
                                              'Terms & conditions',
                                              style: smalltext2,
                                            ),
                                          ),
                                          Text(
                                            ' & ',
                                            style: smalltext1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/privacypoliciesPage');
                                    },
                                    child: Text(
                                      'Privacy Policy.',
                                      style: smalltext2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: Get.height * 0.025),
                              AuthButton(
                                  containercolor:
                                      _.isAgreed.value ? yellow : Colors.grey,
                                  textcolor: Colors.black,
                                  width: double.infinity,
                                  text: 'Signup',
                                  ontap: () {
                                    if (_.isAgreed.value) {
                                      if (!_.emailController.text
                                          .contains('@')) {
                                        _.validation('Email is not valid', red);
                                      } else if (_.phoneNumberController.text
                                              .length <
                                          12) {
                                        _.validation(
                                            'Mobile Number cannot be less than 12 digits',
                                            red);
                                      } else if (_
                                              .passwordController.text.length <
                                          8) {
                                        _.validation(
                                            'Password cannot be less than 8 characters',
                                            red);
                                      } else {
                                        try {
                                          _.isLoading();
                                          _.signUpRequest();
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    }
                                  }),
                              SizedBox(height: Get.height * 0.028),
                              Container(
                                  alignment: Alignment.center,
                                  child:
                                      Text('Signup with', style: mediumtext)),
                              SizedBox(height: Get.height * 0.02),
                              GetBuilder<SignupController>(builder: (_) {
                                return GetBuilder<LoginController>(
                                    builder: (context) {
                                  return AuthPlatformButton(
                                      ontap: () {
                                        if (_.isAgreed.value) {
                                          _.isLoading();
                                          _.loginWithApple();
                                        }
                                      },
                                      icon: APPLE_ICON,
                                      containercolor: _.isAgreed.value
                                          ? Colors.black
                                          : Colors.grey,
                                      textcolor: Colors.white,
                                      text: '     Continue With Apple',
                                      route: '/platformsignupPage');
                                });
                              }),
                              SizedBox(height: Get.height * 0.021),
                              GetBuilder<SignupController>(builder: (_) {
                                return AuthPlatformButton(
                                    ontap: () {
                                      if (_.isAgreed.value) {
                                        _.isLoading();
                                        _.SignupWithGoogle();
                                      }
                                    },
                                    icon: GOOGLE_ICON,
                                    containercolor: _.isAgreed.value
                                        ? Colors.white
                                        : Colors.grey,
                                    textcolor: Colors.black,
                                    text: '     Continue With Google',
                                    route: '/platformsignupPage');
                              }),
                              SizedBox(height: Get.height * 0.034),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Don\'t have an account!',
                                  style: mediumtext,
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              const AuthButton(
                                containercolor: Color.fromRGBO(41, 104, 150, 1),
                                textcolor: Colors.white,
                                text: 'Sign in',
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _.loading.value
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
        );
      }),
    );
  }
}
