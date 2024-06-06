import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/contanct_us_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND3,
              fit: BoxFit.cover,
              width: Get.width,
            ),
            SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    children: [
                      CustomAppBar(title: '${initController.details.title}'),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      CircleButton(
                          icon: CONTACT_US_ICON, width: 150.r, onTap: () {}),
                      AuthButton(
                        containercolor: yellow,
                        textcolor: black,
                        text: '${initController.details.title}',
                        width: 210.r,
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      GetBuilder<ContactUsController>(builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            // _.launchEmail(initController.details.email!,'','' );
                          },
                          child: SizedBox(
                            width: Get.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(EMAIL_LOGO_ICON),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    '${initController.details.email}',
                                    style: materialfont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      GetBuilder<ContactUsController>(builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            _.makePhoneCall(initController.details.phone!);
                          },
                          child: SizedBox(
                            width: Get.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(PHONE_LOGO_ICON),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    '${initController.details.phone}',
                                    style: materialfont,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      GetBuilder<ContactUsController>(builder: (_) {
                        final Uri toLaunch = Uri(
                            scheme: 'https',
                            host: '${initController.details.website}',
                            path: 'headers/');
                        return GestureDetector(
                          onTap: () {
                            _.launchInBrowser(toLaunch);
                          },
                          child: SizedBox(
                            width: Get.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(WEBSITE_LOGO_ICON),
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                SizedBox(
                                  width: Get.width * 0.6,
                                  child: Text(
                                    '${initController.details.website}',
                                    style: materialfont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: Get.height * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
