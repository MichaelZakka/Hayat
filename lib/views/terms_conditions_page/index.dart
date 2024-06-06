import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class TermsConditionsPage extends StatelessWidget {
  TermsConditionsPage({super.key});
  final InitController initController = Get.find();
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
                width: Get.width,

                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: 'Terms & Conditions'),
                    SizedBox(
                      height: Get.height * 0.025,
                    ),
                    SizedBox(
                      width: Get.width * 0.86,
                      height: Get.height * 0.8,
                      child: SingleChildScrollView(
                        child: Text(
                            style: mediumtext,
                            '${initController.pages.data![6].content}'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
