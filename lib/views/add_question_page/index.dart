import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/question_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/add_question_page/controller.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/textfield/auth_textfield.dart';

class AddQuestionPage extends StatelessWidget {
  final bool update;
  final QuestionResponse? question;
  AddQuestionPage({super.key, this.update = false, this.question});
  final AddQuestionController addQuestionController =
      Get.put(AddQuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddQuestionController>(builder: (_) {
        if (update) {
          _.setValue(question!.questionText!);
        }
        return Stack(
          children: [
            Column(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.033,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      update
                                          ? 'Update Question'
                                          : 'Add Question',
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
                                SizedBox(
                                  width: Get.width * 0.72,
                                  child: Text(
                                    'Enter your question',
                                    style: consttext,
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.036),
                                AuthTextfield(
                                  textEditingController: _.questionController,
                                  obsecurity: false,
                                  height: Get.height * 0.14,
                                ),
                                SizedBox(height: Get.height * 0.036),
                                Container(
                                  alignment: Alignment.center,
                                  child: AuthButton(
                                      containercolor: yellow,
                                      textcolor: Colors.black,
                                      text: update ? 'UPDATE' : 'ADD',
                                      ontap: () {
                                        _.isLoading();
                                        if (update) {
                                          _.updateQuestionRequest(
                                              '${question!.id}');
                                        } else {
                                          _.addQuestion();
                                        }
                                      }),
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
        );
      }),
    );
  }
}
