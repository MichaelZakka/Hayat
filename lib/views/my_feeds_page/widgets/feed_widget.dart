import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feed_details_page/index.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class FeedWidget extends StatelessWidget {
  FeedWidget({super.key, required this.post});
  final PostResponse post;
  @override
  Widget build(BuildContext context) {
    date() {
      int index = post.createdAt!.indexOf("T");
      String substring =
          index != -1 ? post.createdAt!.substring(0, index) : post.createdAt!;
      return substring;
    }

    return GestureDetector(
      onTap: () {
        Get.to(FeedDetailsPage(post: post));
      },
      child: Container(
        width: Get.width * 0.86,
        height: 250.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: offwhite,
        ),
        child: Center(
          child: SizedBox(
            width: Get.width * 0.8,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.017),
                    SizedBox(
                        width: Get.width * 0.26,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                '$baseUrl/${post.image}',
                                fit: BoxFit.cover,
                              )),
                        )),
                  ],
                ),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.025),
                    SizedBox(
                      width: 125.r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(CALENDER_ICON),
                          Text(
                            date().replaceAll('-', '/'),
                            style: consttext,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.025),
                    SizedBox(
                      width: Get.width * 0.5,
                      height: Get.height * 0.12,
                      child: SingleChildScrollView(
                        child: Text(style: mediumtext, '${post.caption}'),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.025),
                    AuthButton(
                      containercolor: yellow,
                      textcolor: black,
                      text: '${post.status}',
                      width: Get.width * 0.22,
                      textstyle: consttext,
                    ),
                    SizedBox(height: Get.height * 0.025),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
