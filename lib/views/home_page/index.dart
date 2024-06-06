import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/color_page/controller.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          BLUE_BACKGROUND2,
          fit: BoxFit.cover,
          width: Get.width,
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  textstyle: subtitles,
                  icon: FLORA_ICON,
                  text1: 'FLORA',
                  width: 125.r,
                  onTap: () {
                    Get.toNamed('/filterPage');
                  },
                ),
                SizedBox(
                  height: Get.height * 0.084,
                ),
                CircleButton(
                  textstyle: subtitles,
                  icon: FAUNA_ICON,
                  text1: 'FAUNA',
                  width: 125.r,
                  onTap: () async {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
