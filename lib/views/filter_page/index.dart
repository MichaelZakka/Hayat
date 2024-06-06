import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              width: Get.width,
              BLUE_BACKGROUND3,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const CustomAppBar(title: 'FLORA'),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    CircleButton(
                        icon: FLORA_ICON,
                        text1: 'BY COLORS',
                        textstyle: mediumtext,
                        width: 125.r,
                        onTap: () {
                          Get.toNamed('bycolorPage');
                        }),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CircleButton(
                        icon: BY_LETTERS_ICON,
                        width: 125.r,
                        text1: 'BY LETTERS',
                        textstyle: mediumtext,
                        onTap: () {
                          Get.toNamed('/bylettersPage');
                        }),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    CircleButton(
                        icon: INTRODUCTION_ICON,
                        width: 125.r,
                        text1: 'INTRODUCTION',
                        textstyle: mediumtext,
                        onTap: () {
                          Get.toNamed('/introductionPage');
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
