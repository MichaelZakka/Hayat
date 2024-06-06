import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/question_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class MyQuestionWidget extends StatelessWidget {
  const MyQuestionWidget({super.key, this.question});
  final QuestionResponse? question;

  @override
  Widget build(BuildContext context) {
    date() {
      int index = question!.createdAt!.indexOf("T");
      String substring = index != -1
          ? question!.createdAt!.substring(0, index)
          : question!.createdAt!;
      return substring;
    }

    return Container(
      width: Get.width * 0.86,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: offwhite,
      ),
      child: Center(
        child: SizedBox(
          width: Get.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.025),
              SizedBox(
                width: Get.width * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(CALENDER_ICON),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          Text(
                            date().replaceAll('-', '/'),
                            style: consttext,
                          ),
                        ],
                      ),
                    ),
                    AuthButton(
                      containercolor: yellow,
                      textcolor: black,
                      text: '${question!.status}',
                      width: Get.width * 0.21,
                      textstyle: consttext,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              SizedBox(
                width: Get.width * 0.8,
                child: Text(
                    style: mediumtext, 'Question : ${question!.questionText}'),
              ),
              SizedBox(height: Get.height * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}
