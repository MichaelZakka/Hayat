import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/gallery_page/widgets/custom_gallery_widget.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({super.key});
  final InitController initController = Get.find();
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: '${initController.pages.data![3].title}',
                      ),
                      SizedBox(height: Get.height * 0.05),
                      CircleButton(
                          icon: GALLERY_ICON, width: 150.r, onTap: () {}),
                      AuthButton(
                        containercolor: yellow,
                        textcolor: black,
                        text: '${initController.pages.data![3].title}',
                        width: 225.r,
                      ),
                      SizedBox(height: Get.height * 0.037),
                      SizedBox(
                        width: Get.width * 0.7,
                        child: Text(
                          '${initController.pages.data![3].content}',
                          style: mediumtext,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      GetBuilder<InitController>(builder: (_) {
                        double heightOfGrid =
                            initController.images.data!.length / 3;
                        return SizedBox(
                            height: MediaQuery.of(context).size.width > 450
                                ? 230.r* heightOfGrid.ceil()
                                : 140.r * heightOfGrid.ceil(),
                            child: _.isGalleryReady.value
                                ? CustomGalleryWidget()
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: blue1,
                                    ),
                                  ));
                      }),
                    ],
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
