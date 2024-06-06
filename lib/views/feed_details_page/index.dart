import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feed_details_page/controller.dart';
import 'package:hayat/views/post_page/widgets/post_image.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class FeedDetailsPage extends StatelessWidget {
  FeedDetailsPage({super.key, this.post});
  final PostResponse? post;

  final FeedDetailsController feedDetailsController =
      Get.put(FeedDetailsController());

  @override
  Widget build(BuildContext context) {
    date() {
      int index = post!.createdAt!.indexOf("T");
      String substring =
          index != -1 ? post!.createdAt!.substring(0, index) : post!.createdAt!;
      return substring;
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
            height: Get.height,
            child: SvgPicture.asset(
              width: Get.width,
              BLUE_BACKGROUND2,
              fit: BoxFit.cover,
            ),
          ),
          !feedDetailsController.loading.value
              ? Center(
                  child: SizedBox(
                    width: Get.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CustomAppBar(
                            title: 'Details',
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
                                  post: post,
                                ),
                                SizedBox(height: Get.height * 0.024),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 60.r,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GetBuilder<FeedDetailsController>(
                                              builder: (_) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (post!.status ==
                                                    'published') {
                                                  _.likePost(post!.id!);
                                                }
                                              },
                                              child: SvgPicture.asset(
                                                HEART_ICON,
                                                color: post!.likedByMe == 1
                                                    ? blue1
                                                    : Colors.grey,
                                              ),
                                            );
                                          }),
                                          GetBuilder<FeedDetailsController>(
                                              builder: (_) {
                                            return GestureDetector(
                                                onTap: () {
                                                  _.sharePost(post!.id!);
                                                },
                                                child: SvgPicture.asset(
                                                    SHARE_ICON));
                                          })
                                        ],
                                      ),
                                    ),
                                    AuthButton(
                                      containercolor: yellow,
                                      textcolor: black,
                                      text: '${post!.status}',
                                      width: Get.width * 0.2,
                                      textstyle: consttext,
                                    )
                                  ],
                                ),
                                SizedBox(height: Get.height * 0.017),
                                Text(
                                  '${post!.likes}',
                                  style: medium_bold,
                                ),
                                SizedBox(height: Get.height * 0.026),
                                SizedBox(
                                  width: Get.width * 0.28,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(CALENDER_ICON),
                                      Text(
                                        date().replaceAll('-', '/'),
                                        style: consttext,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.026),
                                Center(
                                  child: SizedBox(
                                    width: Get.width * 0.86,
                                    child: Text(
                                      '${post!.caption}',
                                      style: mediumtext,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Get.height * 0.05),
                                Container(
                                  alignment: Alignment.center,
                                  child: AuthButton(
                                      ontap: () {
                                        Get.to(
                                          CustomPopup(
                                            isLoading: feedDetailsController
                                                .loading.value,
                                            content:
                                                'Are you sure want to delete your post?',
                                            title: 'Delete Post',
                                            isquestion: true,
                                            answerontap: () {
                                              feedDetailsController.isLoading();
                                              feedDetailsController
                                                  .deletePost(post!.id!);
                                              feedDetailsController.validation(
                                                  'Your post was deleted successfully',
                                                  green);
                                              Get.offAllNamed('/mainPage');
                                            },
                                          ),
                                        );
                                      },
                                      containercolor: red,
                                      textcolor: white,
                                      text: 'DELETE'),
                                ),
                                SizedBox(height: Get.height * 0.05),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: blue1,
                  ),
                )
        ],
      )),
    );
  }
}
