import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/platform_signup_page/controller.dart';
import 'package:hayat/views/platform_signup_page/widgets/verify_box.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class PlatformSignupPage extends StatelessWidget {
  PlatformSignupPage({super.key});
  final PlatformSignupController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SvgPicture.asset(
            BLUE_BACKGROUND2,
            fit: BoxFit.cover,
            width: Get.width,
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomAppBar(title: 'Otp'),
          ),
          Center(
            child: SizedBox(
              width: Get.width * 0.8,
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.18),
                  Text(
                    'Enter Your',
                    style: titles,
                  ),
                  Text('Verification code!', style: subtitles),
                  SizedBox(
                    height: Get.height * 0.046,
                  ),
                  Text(
                    'We have sent an OTP to email address',
                    style: mediumtext,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'Please enter the code received bellow',
                    style: consttext,
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  VerifyBox(),
                  SizedBox(
                    height: Get.height * 0.0375,
                  ),
                  AuthButton(
                    containercolor: yellow,
                    textcolor: Colors.black,
                    text: 'Verify',
                    ontap: () {
                      _controller.popup();
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.0246,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '00:00',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: Get.height * 0.18,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            'Didn\'t get the code ?',
                            style: mediumtext1,
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          const Text(
                            'Resend code',
                            style: TextStyle(
                                color: Color.fromRGBO(41, 104, 150, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
