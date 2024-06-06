import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/res/styles.dart';

class PlantDetail extends StatelessWidget {
  final String title;
  final String info;
  final Color? color;
  const PlantDetail({
    this.color,
    required this.info,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 165.r,
          height: 44.r,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              title,
              style: consttext,
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
        Container(
          alignment: Alignment.center,
          width: Get.width * 0.7,
          child: Text(
            textAlign: TextAlign.center,
            info,
            style: mediumtext,
          ),
        )
      ],
    );
  }
}
