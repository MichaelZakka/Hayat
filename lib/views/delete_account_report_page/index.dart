import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/delete_account_report_page/controller.dart';
import 'package:hayat/views/delete_account_report_page/widgets/custom_report_radio.dart';
import 'package:hayat/views/home_page/controller.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class DeleteAccountReportPage extends StatelessWidget {
  DeleteAccountReportPage({super.key});
  final HomePageController homePageController = Get.find();
  final DeleteAccountReportController deleteAccountReportController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(193, 215, 225, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Center(
                child: SizedBox(
                    width: Get.width * 0.85,
                    child: SingleChildScrollView(
                      child: GetBuilder<DeleteAccountReportController>(
                          builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.033,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delete Account',
                                  style: subtitles,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: SvgPicture.asset(X_ICON)),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.033,
                            ),
                            Container(
                              width: Get.width * 0.186,
                              height: Get.width * 0.186,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: SvgPicture.asset(
                                  REPORT_ICON,
                                  width: Get.width * 0.065,
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.032),
                            SizedBox(
                              width: Get.width * 0.72,
                              child: Text(
                                'The Reason You want to delete your account',
                                style: largetext,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CustomReportRadio(
                              titles: homePageController.reasons,
                            ),
                            SizedBox(height: Get.height * 0.035),
                            if (_.selectedValue.value ==
                                homePageController.reasons.data!.length - 1)
                              AuthTextfield(
                                textEditingController:
                                    deleteAccountReportController
                                        .reasonController,
                                obsecurity: false,
                                height: Get.height * 0.1,
                              ),
                            SizedBox(height: Get.height * 0.035),
                            AuthButton(
                              containercolor: yellow,
                              textcolor: Colors.black,
                              text: 'SUBMIT',
                              ontap: () {
                                _.popup();
                              },
                            ),
                            SizedBox(
                              height: Get.height * 0.035,
                            ),
                          ],
                        );
                      }),
                    ))),
          )
        ],
      ),
    );
  }
}
