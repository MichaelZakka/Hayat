import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});
  final InitController initController = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.054),
          SvgPicture.asset(LOCATION_ICON),
          SizedBox(height: Get.height * 0.05),
          SizedBox(
            width: Get.width * 0.86,
            child: Text(
              '${initController.pages.data![6].content}',
              style: mediumtext,
            ),
          ),
          SizedBox(height: Get.height * 0.05),
        ],
      ),
    );
  }
}
