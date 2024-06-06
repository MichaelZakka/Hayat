import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage({super.key});
  final InitController initController = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(title: 'Introduction'),
        body: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND3,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.14),
                  CircleButton(
                      istext: false,
                      icon: INTRODUCTION_ICON,
                      width: 150.r,
                      onTap: () {}),
                  SizedBox(
                    height: Get.height * 0.046,
                  ),
                  Container(
                    width: 200.r,
                    height: 44.r,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(249, 224, 76, 1),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        '${initController.pages.data![0].title}',
                        style: materialfont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.033,
                  ),
                  SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        textAlign: TextAlign.center,
                        '${initController.pages.data![0].content}',
                        style: mediumtext,
                      )),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
