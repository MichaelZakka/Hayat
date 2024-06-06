import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/buttons/circle_button.dart';

class HayatPage extends StatelessWidget {
  const HayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            BLUE_BACKGROUND2,
            fit: BoxFit.cover,
            width: Get.width,
          ),
          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width * 0.75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                          CircleButton(
                            icon: GALLERY_ICON,
                            width: 125.r,
                            onTap: () {
                              Get.toNamed('/galleryPage');
                            },
                            text1: 'GALLERY',
                            textstyle: mediumtext,
                          ),
                          SizedBox(height: Get.height * 0.06),
                          CircleButton(
                              text1: 'TRIPS',
                              textstyle: mediumtext,
                              icon: TRIPS_ICON,
                              width: 125.r,
                              onTap: () {
                                Get.toNamed('/tripsPage');
                              }),
                          SizedBox(height: Get.height * 0.06),
                          CircleButton(
                              icon: CONTACT_US_ICON,
                              text1: 'CONTACT US',
                              textstyle: mediumtext,
                              width: 125.r,
                              onTap: () {
                                Get.toNamed('/contactusPage');
                              }),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.075,
                          ),
                          CircleButton(
                              icon: OUR_TEAM_ICON,
                              text1: 'OUR TEAM',
                              textstyle: mediumtext,
                              width: 125.r,
                              onTap: () {
                                Get.toNamed('/ourteamPage');
                              }),
                          SizedBox(height: Get.height * 0.06),
                          CircleButton(
                              text1: 'SPONSORS',
                              textstyle: mediumtext,
                              icon: SPONSERS_ICON,
                              width: 125.r,
                              onTap: () {
                                Get.toNamed('/sponsersPage');
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
