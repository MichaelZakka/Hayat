import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/account_page/controller.dart';
import 'package:hayat/views/account_page/widgets/custom_listtile.dart';
import 'package:hayat/views/edit_account/controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});
  final AccountController _accountController = Get.find();
  final InitController initController = Get.find();
  final EditAccountController editAccountController =
      Get.put(EditAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SvgPicture.asset(
            BLUE_BACKGROUND2,
            fit: BoxFit.cover,
            width: Get.width,
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width * 0.86,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.085,
                    ),
                    GetBuilder<AccountController>(builder: (_) {
                      return Container(
                        width: Get.width * 0.86,
                        // height: Get.height * 0.4,
                        decoration: BoxDecoration(
                            color: cyan,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            SvgPicture.asset(
                              ACCOUNT_PAGE_ICON,
                              width: Get.width * 0.24,
                            ),
                            SizedBox(height: Get.height * 0.015),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                '${initController.userData!.user!.fullName}',
                                textAlign: TextAlign.center,
                                style: largetext2,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.015),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                '${initController.userData!.user!.email}',
                                textAlign: TextAlign.center,
                                style: mediumtext,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.015),
                            SizedBox(
                              width: Get.width * 0.5,
                              child: Text(
                                '${initController.userData!.user!.mobileNumber}',
                                textAlign: TextAlign.center,
                                style: mediumtext,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.025),
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    Text(
                      'Setting',
                      style: medium_bold,
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: mediumtext,
                        ),
                        GetBuilder<AccountController>(builder: (_) {
                          return CupertinoSwitch(
                            activeColor: blue1,
                            value: (_.notification.value),
                            onChanged: (newvalue) {
                              _.switchNotification();
                            },
                          );
                        })
                      ],
                    )),
                    SizedBox(height: Get.height * 0.025),
                    Text(
                      'Account',
                      style: medium_bold,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                        ontap: () {
                          Get.toNamed('/editaccountPage');
                        },
                        image: EDIT_ACCOUNT_ICON,
                        title: 'Edit Account'),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                      image: MY_FEEDS_ICON,
                      title: 'My Feeds',
                      ontap: () {
                        Get.toNamed('/myfeedsPage');
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                      image: MY_QUESTIONS_ICON,
                      title: 'My Questions',
                      ontap: () {
                        Get.toNamed('/myquestionsPage');
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                      image: LOGOUT_ICON,
                      title: 'Logout',
                      ontap: () {
                        _accountController.popup();
                      },
                    ),
                    SizedBox(height: Get.height * 0.025),
                    Text(
                      'Suppourt',
                      style: medium_bold,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                        image: TERMS_CONDITIONS_ICON,
                        ontap: () {
                          Get.toNamed('/termsconditionsPage');
                        },
                        title: 'Terms & Conditions'),
                    SizedBox(height: Get.height * 0.02),
                    CustomListTile(
                        image: PRIVACY_POLICIES_ICON,
                        ontap: () {
                          Get.toNamed('/privacypoliciesPage');
                        },
                        title: 'Privacy Policies'),
                    SizedBox(height: Get.height * 0.04),
                    Container(
                      height: 75.r,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'V.1.0',
                            style: consttext,
                          ),
                          Text(
                            '© 2024 Hayat App. All rights reserved',
                            style: consttext,
                          ),
                          Text(
                            'Powered By Line',
                            style: consttext,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
