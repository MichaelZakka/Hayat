import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/main_page/controller.dart';
import 'package:hayat/widgets/custom_svg/cusotm_svg_image.dart';

class CustomNavigationBar extends StatelessWidget {
  CustomNavigationBar({super.key});

  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (_) {
      return BottomAppBar(
        height: 70.r,
        color: const Color.fromRGBO(235, 241, 249, 1),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    mainPageController.moveBetweenPages(0);
                  },
                  child: Column(
                    children: [
                      CustomSvgImage(
                        onTap: () {
                          mainPageController.moveBetweenPages(0);
                        },
                        width: 22.r,
                        height: 30.r,
                        image: _.pageIndex.value == 0
                            ? HOME_ICON_BLUE
                            : HOME_ICON_BLACK,
                      ),
                      Text(
                        'Home',
                        style: smalltext1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    mainPageController.moveBetweenPages(1);
                  },
                  child: Column(
                    children: [
                      CustomSvgImage(
                        width: 22.r,
                        height: 22.r,
                        image: _.pageIndex.value == 1
                            ? FEEDS_ICON_BLUE
                            : FEEDS_ICON_BLACK,
                      ),
                      Text(
                        'Feeds',
                        style: smalltext1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    mainPageController.moveBetweenPages(2);
                  },
                  child: Column(
                    children: [
                      CustomSvgImage(
                        width: 22.r,
                        height: 22.r,
                        image: _.pageIndex.value == 2
                            ? HAYAT_ICON_BLUE
                            : HAYAT_ICON_BLACK,
                      ),
                      Text(
                        'Hayat',
                        style: smalltext1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    mainPageController.moveBetweenPages(3);
                  },
                  child: Column(
                    children: [
                      CustomSvgImage(
                        width: 25.r,
                        height: 22.r,
                        image: _.pageIndex.value == 3
                            ? WEATHER_ICON_BLUE
                            : WEATHER_ICON_BLACK,
                      ),
                      Text(
                        'Weather',
                        style: smalltext1,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    mainPageController.moveBetweenPages(4);
                  },
                  child: Column(
                    children: [
                      CustomSvgImage(
                        width: 18.r,
                        height: 18.r,
                        image: _.pageIndex.value == 4
                            ? ACCOUNT_ICON_BLUE
                            : ACCOUNT_ICON_BLACK,
                      ),
                      Text(
                        'Account',
                        style: smalltext1,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
