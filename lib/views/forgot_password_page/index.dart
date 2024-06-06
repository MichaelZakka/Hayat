import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/forgot_password_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class ForgotpasswordPage extends StatelessWidget {
  ForgotpasswordPage({super.key});
  final ForgotpasswordController _forgotpasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              width: Get.width,
              BLUE_BACKGROUND3,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.658,
                    ),
                    SvgPicture.asset(
                      FLOWER_LOGO,
                      width: Get.width * 0.25,
                    )
                  ],
                ),
              ],
            ),
            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    CustomAppBar(title: 'Forgot Password'),
                    SizedBox(
                      width: Get.width * 0.86,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.15),
                          Row(
                            children: [
                              Text(
                                'Forget ',
                                style: titles,
                              ),
                              Text('your password', style: subtitles),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.026),
                          Text(
                            'Please enter your email address',
                            style: mediumtext,
                          ),
                          SizedBox(height: Get.height * 0.031),
                          Text(
                            'Email Address*',
                            style: smalltext1,
                          ),
                          SizedBox(
                            height: Get.height * 0.013,
                          ),
                          AuthTextfield(
                            obsecurity: false,
                            textEditingController:
                                _forgotpasswordController.emailController,
                          ),
                          SizedBox(height: Get.height * 0.04),
                          AuthButton(
                            containercolor: yellow,
                            textcolor: black,
                            ontap: () {
                              if (!(_forgotpasswordController.emailController.text
                                      .endsWith('.com') &&
                                  _forgotpasswordController.emailController.text
                                      .contains('@'))) {
                                _forgotpasswordController
                                    .validation('Invalid email address');
                              }
                              // _forgotpasswordController.popup();
                            },
                            text: 'SEND',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
