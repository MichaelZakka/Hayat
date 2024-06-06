import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/views/post_page/index.dart';

class PostWidget extends StatelessWidget {
  final PostResponse postResponse;
  final Color? color;
  PostWidget({this.color, super.key, required this.postResponse});
  final FeedsController feedsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(PostPage(
          postResponse: postResponse,
        ));
      },
      child: Container(
        width: Get.width * 0.86,
        // height: Get.height * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.r),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        '$baseUrl/${postResponse.image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: 60.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<FeedsController>(builder: (_) {
                        return GestureDetector(
                          onTap: () {
                            _.likePost(postResponse.id!);
                            if (postResponse.likedByMe == 1) {
                              postResponse.likes = postResponse.likes! - 1;
                              postResponse.likedByMe = 0;
                            } else if (postResponse.likedByMe == 0) {
                              postResponse.likes = postResponse.likes! + 1;

                              postResponse.likedByMe = 1;
                            }
                            _.update();
                          },
                          child: SvgPicture.asset(HEART_ICON,
                              color: postResponse.likedByMe == 1
                                  ? blue1
                                  : Colors.grey),
                        );
                      }),
                      GetBuilder<FeedsController>(builder: (_) {
                        return GestureDetector(
                            onTap: () {
                              _.sharePost(postResponse.id!);
                            },
                            child: SvgPicture.asset(SHARE_ICON));
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.016,
                ),
                Text('${postResponse.likes}', style: smalltext3),
                SizedBox(
                  height: Get.height * 0.022,
                ),
                SizedBox(
                    width: Get.width * 0.7,
                    child: Text(
                      '${postResponse.caption}',
                      style: smalltext1,
                    )),
                SizedBox(
                  height: Get.height * 0.022,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
