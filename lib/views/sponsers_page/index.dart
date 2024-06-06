import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/sponsers_page/controller.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class SponsersPage extends StatelessWidget {
  SponsersPage({super.key});
  final InitController initController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue2,
      body: SafeArea(
        child: Center(
          child: Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomAppBar(
                        title: '${initController.pages.data![4].title}'),
                    SizedBox(height: Get.height * 0.05),
                    CircleButton(
                        icon: SPONSERS_ICON, width: 150.r, onTap: () {}),
                    AuthButton(
                      containercolor: yellow,
                      textcolor: black,
                      text: '${initController.pages.data![4].title}',
                      width: 210.r,
                    ),
                    SizedBox(height: Get.height * 0.037),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Text(
                          style: mediumtext,
                          textAlign: TextAlign.center,
                          '${initController.pages.data![4].content}'),
                    ),
                    SizedBox(height: Get.height * 0.037),
                    SizedBox(
                      height: 250.r * initController.sponsers.data!.length,
                      child: GetBuilder<SponsersController>(builder: (_) {
                        return ListView.builder(
                            controller: _.scrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: initController.sponsers.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleButton(
                                  icon: initController
                                      .sponsers.data![index].logo!,
                                  width: 150.r,
                                  onTap: () {},
                                  text1:
                                      '${initController.sponsers.data![index].name}',
                                  textstyle: materialfont,
                                ),
                              );
                            });
                      }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
