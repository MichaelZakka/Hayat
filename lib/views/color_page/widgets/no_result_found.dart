import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';

class NoResultFound extends StatelessWidget {
  const NoResultFound({required this.color, super.key});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.86,
      color: color,
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.04,
          ),
          SvgPicture.asset(NO_RESULT_ICON),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Text(
            'No Results Found',
            style: materialfont,
          ),
          SizedBox(
            height: Get.height * 0.025,
          ),
          Container(
              width: Get.width * 0.7,
              height: Get.height * 0.18,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: mediumtext,
                ),
              )),
          SizedBox(
            height: Get.height * 0.02,
          )
        ],
      ),
    );
  }
}
