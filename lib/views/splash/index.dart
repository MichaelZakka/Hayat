import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/views/splash/controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND1,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: SvgPicture.asset(FLOWER_LOGO),
            )
          ],
        ),
      );
    });
  }
}
