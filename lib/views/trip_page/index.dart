import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/trip_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/appbar/custom_appbar.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key, this.trip});
  final TripResponse? trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SvgPicture.asset(
            BLUE_BACKGROUND2,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomAppBar(title: 'Trips'),
                      SizedBox(
                        width: Get.width * 0.86,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  baseUrl + trip!.image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            SizedBox(
                                width: Get.width * 0.28,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(CALENDER_ICON),
                                    SizedBox(
                                      child: Text(
                                        trip!.date!.replaceAll('-', '/'),
                                        style: consttext,
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: Get.height * 0.027,
                            ),
                            SizedBox(
                              child: Text(
                                '${trip!.briefDescription}',
                                style: largetext,
                              ),
                            ),
                            SizedBox(height: Get.height * 0.027),
                            SizedBox(
                              child: Text(
                                  style: mediumtext,
                                  '${trip!.fullDescription}'),
                            ),
                            SizedBox(
                              height: Get.height * 0.027,
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
      )),
    );
  }
}
