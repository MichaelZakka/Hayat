import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class FeedsPage extends StatelessWidget {
  FeedsPage({super.key});
  final FeedsController feedsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: Stack(
        children: [
          SizedBox(
            child: SvgPicture.asset(
              BLUE_BACKGROUND2,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: GetBuilder<FeedsController>(builder: (_) {
              return _.isDataReady.value
                  ? _.feeds.data!.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SvgPicture.asset(NO_FEED),
                            ),
                            SizedBox(
                              height: Get.height * 0.025,
                            ),
                            Text(
                              'No Feeds !',
                              style: big_bold_black,
                            )
                          ],
                        )
                      : SizedBox(
                          height: Get.height,
                          width: Get.width * 0.86,
                          // child: ListView.builder(
                          //   controller: _.scrollController,
                          //   itemCount: _.feeds.data!.length,
                          //   itemBuilder: (context, index) {
                          //     return Padding(
                          //       padding:
                          //           const EdgeInsets.symmetric(vertical: 10),
                          //       child: PostWidget(
                          //         postResponse: _.feeds.data![index],
                          //         color: _.feeds.data![index].likedByMe == 1
                          //             ? blue1
                          //             : Colors.grey,
                          //       ),
                          //     );
                          //   },
                          // ),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        color: blue1,
                      ),
                    );
            }),
          ),
          Positioned(
            bottom: 0,
            right: 5,
            child: CircleButton(
              icon: ADD_POST_ICON,
              width: 60.r,
              onTap: () async {
                if (await feedsController.locationPermission()) {
                  if (await feedsController.cameraPermission()) {
                    feedsController.pickImageFromCamera();
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
