import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';

class CustomListTile extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? ontap;
  const CustomListTile(
      {super.key, this.ontap, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                image,
                width: Get.width * 0.14,
              ),
              SizedBox(
                width: Get.width * 0.025,
              ),
              Text(
                title,
                style: materialfont,
              )
            ],
          ),
          SvgPicture.asset(FORWARD_ARROW_ICON)
        ],
      ),
    );
  }
}
