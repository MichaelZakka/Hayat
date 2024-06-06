import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/my_feeds_page/controller.dart';
import 'package:hayat/views/my_feeds_page/widgets/feed_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class MyFeedsPage extends StatelessWidget {
  MyFeedsPage({super.key});
  final MyFeedsController myFeedsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SvgPicture.asset(
            BLUE_BACKGROUND3,
            fit: BoxFit.cover,
                width: Get.width,

          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  CustomAppBar(title: 'My Feeds'),
                  SizedBox(
                    height: 20.r,
                  ),
                  Expanded(
                    flex: 1,
                    child: GetBuilder<MyFeedsController>(builder: (_) {
                      return _.isDataReady.value
                          ? _.myFeed.data!.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(NO_FEED),
                                      SizedBox(
                                        height: Get.height * 0.025,
                                      ),
                                      Text(
                                        'No Feeds !',
                                        style: big_bold_black,
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  // height: MediaQuery.of(context).size.height  - 112.r,
                                  width: Get.width * 0.86,
                                  child: ListView.builder(
                                      itemCount: _.myFeed.data!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            FeedWidget(
                                              post: _.myFeed.data![index],
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.025,
                                            )
                                          ],
                                        );
                                      }),
                                )
                          : Center(
                              child: CircularProgressIndicator(
                                color: blue1,
                              ),
                            );
                    }),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
