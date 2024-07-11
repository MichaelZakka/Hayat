import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/post_report_page/widgets/report_radio.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class DeleteAccountController extends GetxController {
  Widget reportPopup(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * 0.77,
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
                      child: Column(
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
                              'The Reason You Find This Content Objectionable!',
                              style: largetext,
                            ),
                          ),
                          SizedBox(height: Get.height * 0.036),
                          const ReportRadio(titles: [
                            'Content',
                            'Graphic Violence',
                            'Hateful or abusive content',
                            'Improper content rating',
                            'Illegal prescription or other drug',
                            'Copycat or impersonation',
                            'Other Objection',
                          ]),
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                          AuthButton(
                            containercolor: Color.fromRGBO(249, 224, 76, 1),
                            textcolor: Colors.black,
                            text: 'SUBMIT',
                            ontap: () {
                              Get.offAllNamed('/');
                            },
                          ),
                          SizedBox(
                            height: Get.height * 0.035,
                          ),
                        ],
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
