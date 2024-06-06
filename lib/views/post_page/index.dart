import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/views/post_page/controller.dart';
import 'package:hayat/views/post_page/widgets/post_image.dart';
import 'package:hayat/views/post_report_page/index.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class PostPage extends StatelessWidget {
  final PostResponse? postResponse;
  PostPage({this.postResponse, super.key});
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    String? removeAfterCharacter() {
      int index = postResponse!.createdAt!.indexOf('T');
      if (index != -1) {
        return postResponse!.createdAt!.substring(0, index);
      }
      return postResponse!.createdAt;
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              BLUE_BACKGROUND4,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: 'Details',
                          secondIcon: true,
                          icon: REPORT_ICON,
                          ontap: () {
                            Get.to(PostReportPage(
                              post: postResponse,
                            ));
                          },
                        ),
                        SizedBox(
                          width: Get.width * 0.86,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              PostImage(
                                post: postResponse,
                              ),
                              SizedBox(height: Get.height * 0.024),
                              SizedBox(
                                width: 60.r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GetBuilder<PostController>(builder: (_) {
                                      return GestureDetector(
                                        onTap: () {
                                          _.likePost(postResponse!.id!);
                                          if (postResponse!.likedByMe == 1) {
                                            postResponse!.likes =
                                                postResponse!.likes! - 1;
                                            postResponse!.likedByMe = 0;
                                          } else if (postResponse!.likedByMe ==
                                              0) {
                                            postResponse!.likes =
                                                postResponse!.likes! + 1;
                                            postResponse!.likedByMe = 1;
                                          }
                                          _.update();
                                        },
                                        child: SvgPicture.asset(
                                          HEART_ICON,
                                          color: postResponse!.likedByMe == 1
                                              ? blue1
                                              : Colors.grey,
                                        ),
                                      );
                                    }),
                                    GetBuilder<FeedsController>(builder: (_) {
                                      return GestureDetector(
                                          onTap: () {
                                            _.sharePost(postResponse!.id!);
                                          },
                                          child: SvgPicture.asset(SHARE_ICON));
                                    })
                                  ],
                                ),
                              ),
                              SizedBox(height: Get.height * 0.017),
                              GetBuilder<PostController>(builder: (context) {
                                return Text(
                                  '${postResponse!.likes}',
                                  style: medium_bold,
                                );
                              }),
                              SizedBox(height: Get.height * 0.026),
                              SizedBox(
                                width: 125.r,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(CALENDER_ICON),
                                    Text(
                                      removeAfterCharacter()!
                                          .replaceAll('-', '/'),
                                      style: consttext,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: Get.height * 0.026),
                              SizedBox(
                                width: Get.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Posted by ',
                                      style: mediumtext_blue,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        '${postResponse!.user!.fullName}',
                                        style: medium_bold_italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.021,
                              ),
                              Center(
                                child: SizedBox(
                                  width: Get.width * 0.86,
                                  child: Text(
                                    '${postResponse!.caption}',
                                    style: mediumtext,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.05,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
