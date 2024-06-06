import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/question_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/add_question_page/index.dart';
import 'package:hayat/views/question_details_page/controller.dart';
import 'package:hayat/views/question_details_page/widgets/my_question_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class QuestionDetailsPage extends StatelessWidget {
  final QuestionResponse? question;
  QuestionDetailsPage({this.question, super.key});
  final QuestionDetailsController questionDetailsController =
      Get.put(QuestionDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<QuestionDetailsController>(builder: (_) {
          return Stack(
            children: [
              _.loading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: blue1,
                      ),
                    )
                  : SizedBox(
                      height: Get.height,
                      child: SvgPicture.asset(
                        BLUE_BACKGROUND2,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
              // question!.status == 'pending'
              //     ? Positioned(
              //         right: 30,
              //         top: 20,
              //         child: GestureDetector(
              //           onTap: () {
              //             print('object');
              //             // Get.to(AddQuestionPage(
              //             //   update: true,
              //             // ));
              //           },
              //           child:  Text(
              //               'Edit',
              //               style: smalltext2,
              //             ),
              //         ))
              //     : const SizedBox(),
              Center(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          height: Get.height * 0.84,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAppBar(
                                title: 'My Question Details',
                                isText: question!.status == 'pending'
                                    ? true
                                    : false,
                                ontap: () {
                                  Get.to(AddQuestionPage(
                                    update: true,
                                    question: question,
                                  ));
                                },
                              ),
                              SizedBox(
                                height: Get.height * 0.025,
                              ),
                              Center(
                                child: SizedBox(
                                  width: Get.width * 0.86,
                                  child:
                                      //  isanswered
                                      // ?
                                      Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyQuestionWidget(
                                        question: question,
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.025,
                                      ),
                                      question!.answer == null
                                          ? Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: Get.height * 0.15,
                                                  ),
                                                  SvgPicture.asset(
                                                    NOT_REPLIED_ICON,
                                                    width: Get.width * 0.3,
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.025,
                                                  ),
                                                  Text(
                                                    'Not Replied !',
                                                    style: big_bold_black,
                                                  )
                                                ],
                                              ),
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    '${question!.status}',
                                                    style: medium_bold_blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.025,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.86,
                                                  child: Text(
                                                      style: mediumtext,
                                                      '${question!.questionText}'),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.025,
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.025,
                                                ),
                                                SizedBox(
                                                  width: Get.width * 0.86,
                                                  child: Text(
                                                      style: mediumtext,
                                                      '${question!.questionText}'),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.025,
                                                ),
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      AuthButton(
                        containercolor: red,
                        textcolor: white,
                        text: 'DELETE',
                        ontap: () {
                          _.isLoading();
                          _.deleteQuestionRequest(question!.id!);
                          _.validation(
                              'Your Question has been deleted successfully',
                              green);
                          Get.offAllNamed('/mainPage');
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
