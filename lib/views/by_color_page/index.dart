import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/by_color_page/controller.dart';
import 'package:hayat/views/color_page/index.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class ByColorPage extends StatelessWidget {
  const ByColorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: Get.height,
        child: GetBuilder<ByColorController>(builder: (_) {
          return Stack(
            children: [
              SizedBox(
                height: Get.height,
                child: SvgPicture.asset(
                  BLUE_BACKGROUND2,
                  fit: BoxFit.cover,
                  width: Get.width,
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'BY Color',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleButton(
                              icon: PURPLE_BLUE,
                              textstyle: mediumtext,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'PURPLE/BLUE',
                                      id: 1,
                                    ));
                              },
                              text1: 'PURPLE/BLUE',
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CircleButton(
                              textstyle: mediumtext,
                              icon: RED_PINK,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'RED/PINK',
                                      id: 3,
                                    ));

                                // _.getAllColorsRequest();
                              },
                              text1: 'RED/PINK',
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CircleButton(
                              textstyle: mediumtext,
                              icon: WHITE_CREAMY,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'WHITE/CREAMY',
                                      id: 5,
                                    ));
                              },
                              text1: 'WHITE/CREAMY',
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CircleButton(
                              textstyle: mediumtext,
                              icon: ALL_COLORS,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      id: 7,
                                    ));
                              },
                              text1: 'ALL COLORS',
                            ),
                            SizedBox(height: Get.height * 0.036),
                          ],
                        ),
                        Column(
                          children: [
                            CircleButton(
                              textstyle: mediumtext,
                              icon: YELLOW_ORANGE,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'YELLOW/ORANGE',
                                      id: 2,
                                    ));
                              },
                              text1: 'YELLOW/ORANGE',
                              text2: 'ORANGE',
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CircleButton(
                              textstyle: mediumtext,
                              icon: GREEN,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'GREEN',
                                      id: 4,
                                    ));
                              },
                              text1: 'GREEN',
                            ),
                            SizedBox(height: Get.height * 0.036),
                            CircleButton(
                              textstyle: mediumtext,
                              icon: BROWN,
                              width: 125.r,
                              onTap: () {
                                Get.to(() => ColorPage(
                                      color: 'BROWN',
                                      id: 6,
                                    ));
                              },
                              text1: 'BROWN',
                            ),
                            SizedBox(height: Get.height * 0.036),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
