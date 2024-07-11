import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/post_report_page/controller.dart';
import 'package:hayat/views/post_report_page/widgets/report_radio.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';
// import 'package:hayat/widgets/textfield/auth_textfield.dart';

class PostReportPage extends StatelessWidget {
  PostReportPage({super.key, this.post});
  final PostReportController _postReportController =
      Get.put(PostReportController());
  final PostResponse? post;

  @override
  Widget build(BuildContext context) {
    List<String> reasons = [
      'Content',
      'Graphic Violence',
      'Hateful or abusive content',
      'Improper content rating',
      'Illegal prescription or other drug',
      'Copycat or impersonation',
      'Other Objection',
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GetBuilder<PostReportController>(builder: (_) {
          return SizedBox(
            child: _.loading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: blue1,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: Get.width,
                        height: MediaQuery.of(context).size.height > 650
                            ? 550.r
                            : 400.r,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(193, 215, 225, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        child: SingleChildScrollView(
                          child: Center(
                              child: SizedBox(
                                  width: Get.width * 0.85,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.033,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Report Post',
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
                                            borderRadius:
                                                BorderRadius.circular(8)),
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
                                      ReportRadio(titles: reasons),
                                      SizedBox(
                                        height: Get.height * 0.035,
                                      ),
                                      if (_.selectedValue.value == 5)
                                        AuthTextfield(
                                          obsecurity: false,
                                          height: 80.r,
                                          textEditingController:
                                              _.reasonController,
                                        ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          )
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: AuthButton(
                                          containercolor: yellow,
                                          width: 250.r,
                                          textcolor: Colors.black,
                                          text: 'SUBMIT',
                                          ontap: () {
                                            if (_.selectedValue.value == 5) {
                                              if (_.reasonController.text
                                                  .isEmpty) {
                                                _.validation(
                                                    'This field cannot be empty',
                                                    red);
                                              } else {
                                                _.isLoading();
                                                _.postReportRequest(post!.id!,
                                                    _.reasonController.text);
                                                _.popup();
                                              }
                                            } else {
                                              _.isLoading();
                                              _.postReportRequest(
                                                  post!.id!,
                                                  reasons[
                                                      _.selectedValue.value]);
                                              _.popup();
                                            }
                                            print(MediaQuery.of(context)
                                                .size
                                                .height);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.025,
                                      ),
                                    ],
                                  ))),
                        ),
                      )
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
