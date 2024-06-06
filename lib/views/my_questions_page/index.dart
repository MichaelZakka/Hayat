import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/my_questions_page/controller.dart';
import 'package:hayat/views/my_questions_page/widgets/question_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class MyQuestionsPage extends StatelessWidget {
  MyQuestionsPage({super.key});
  final MyQuestionsController myQuestionsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              child: SvgPicture.asset(
                BLUE_BACKGROUND3,
                fit: BoxFit.cover,
                width: Get.width,

              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomAppBar(title: 'My Questions'),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      GetBuilder<MyQuestionsController>(builder: (_) {
                        return Center(
                            child: _.isDataReady.value
                                ? _.questions.data!.isEmpty
                                    ? Column(
                                        children: [
                                          SvgPicture.asset(
                                              MY_QUESTIONS_PAGE_ICON),
                                          SizedBox(
                                            height: Get.height * 0.025,
                                          ),
                                          Text(
                                            'No Questions !',
                                            style: big_bold_black,
                                          )
                                        ],
                                      )
                                    : SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height -
                                                40.r,
                                        width: Get.width * 0.86,
                                        child: ListView.builder(
                                            controller: _.scrollController,
                                            itemCount: _.questions.data!.length,
                                            itemBuilder: (context, index) {
                                              return Column(
                                                children: [
                                                  QuestionWidget(
                                                    question: _
                                                        .questions.data![index],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.025,
                                                  )
                                                ],
                                              );
                                            }),
                                      )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: blue1,
                                    ),
                                  ));
                      }),
                      SizedBox(
                        height: Get.height * 0.025,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 0,
              child: CircleButton(
                  icon: ADD_POST_ICON,
                  width: 60.r,
                  onTap: () {
                    Get.toNamed('/addquestionPage');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
