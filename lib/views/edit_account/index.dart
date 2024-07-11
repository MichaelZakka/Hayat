import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/edit_account/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class EditAccountPage extends StatelessWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAccountController>(builder: (_) {
      _.test();
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Stack(
            children: [
              SizedBox(
                height: Get.height,
                child: SvgPicture.asset(
                  width: Get.width,
                  BLUE_BACKGROUND3,
                  fit: BoxFit.cover,
                ),
              ),
              const CustomAppBar(title: 'Edit Account'),
              Center(
                child: SizedBox(
                  width: Get.width * 0.86,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.08),
                      Text(
                        '${_.emailController.text}',
                        style: mediumtext,
                      ),
                      SizedBox(height: Get.height * 0.025),
                      Text(
                        'Full name',
                        style: consttext,
                      ),
                      SizedBox(height: Get.height * 0.005),
                      AuthTextfield(
                        obsecurity: false,
                        textEditingController: _.fullNameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      // Text(
                      //   'Email Address',
                      //   style: consttext,
                      // ),
                      // SizedBox(height: Get.height * 0.005),
                      // AuthTextfield(
                      //   obsecurity: false,
                      //   color: lightcyan4,
                      //   textEditingController: _.emailController,
                      // ),
                      // SizedBox(
                      //   height: Get.height * 0.03,
                      // ),
                      Text(
                        'Mobile Number',
                        style: consttext,
                      ),
                      SizedBox(height: Get.height * 0.005),
                      AuthTextfield(
                        obsecurity: false,
                        textEditingController: _.mobileNumberController,
                      ),
                      SizedBox(height: Get.height * 0.045),
                      Container(
                        alignment: Alignment.center,
                        child: AuthButton(
                          containercolor: yellow,
                          textcolor: black,
                          text: 'UPDATE',
                          ontap: () async {
                            if (_.emailController.text.isEmpty &&
                                _.fullNameController.text.isEmpty &&
                                _.mobileNumberController.text.isEmpty) {
                              _.validation('There is nothing to update', red);
                            } else {
                              _.isLoading();
                              _.updateUser();
                            }
                          },
                        ),
                      ),
                      SizedBox(height: Get.height * 0.05),
                      Container(
                        alignment: Alignment.center,
                        child: AuthButton(
                          containercolor: Colors.transparent,
                          textcolor: yellow,
                          text: 'Delete Account',
                          textstyle: big_bold,
                          ontap: () {
                            Get.toNamed('/deleteaccountPage');
                          },
                        ),
                      )
                    ],
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
          )),
        ),
      );
    });
  }
}
