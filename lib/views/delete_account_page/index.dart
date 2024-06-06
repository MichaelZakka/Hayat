import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/delete_account_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class DeleteAccountPage extends StatelessWidget {
  DeleteAccountPage({super.key});
  final DeleteAccountController deleteAccountcontroller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: SvgPicture.asset(
              BLUE_BACKGROUND2,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          CustomAppBar(title: 'Delete Account'),
          Center(
            child: SizedBox(
              width: Get.width * 0.86,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.12),
                  SvgPicture.asset(WARNING_ICON),
                  SizedBox(height: Get.height * 0.05),
                  Text(
                    'Do you want to terminate your account?',
                    style: titles,
                  ),
                  SizedBox(height: Get.height * 0.025),
                  Text(
                    'By terminating the account your personal details, feeds and questions will be removed from hayat! You will not be able to recover your account.',
                    style: materialfont,
                  ),
                  SizedBox(height: Get.height * 0.065),
                  AuthButton(
                    containercolor: red,
                    textcolor: white,
                    text: 'Delete Account',
                    ontap: () {
                      // print(object)
                      Get.toNamed('/deleteaccountreportPage');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
