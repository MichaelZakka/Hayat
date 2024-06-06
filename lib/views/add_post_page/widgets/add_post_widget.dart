import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/views/feeds_page/controller.dart';

class AddPostImage extends StatelessWidget {
  const AddPostImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedsController>(builder: (_) {
      return Container(
        width: Get.width * 0.86,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SizedBox(
            height: 400.r,
            width: Get.width*0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * 0.015),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      height:380.r,
                      width: double.infinity,
                      File(_.pickedImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
