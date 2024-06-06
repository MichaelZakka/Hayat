import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/views/feeds_page/controller.dart';

class PostImage extends StatelessWidget {
  PostImage({super.key, this.post});
  final FeedsController feedsController = Get.find();
  final PostResponse? post;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedsController>(builder: (feedsController) {
      return Container(
        width: Get.width * 0.86,
        height: Get.width * 0.86,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.8,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    baseUrl+post!.image!,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      );
    });
  }
}
