import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/trip_response.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/trip_page/index.dart';

class TripWidget extends StatelessWidget {
  const TripWidget({super.key, required this.trip});
  final TripResponse trip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(TripPage(
          trip: trip,
        ));
      },
      child: Container(
        width: Get.width * 0.86,
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
                SizedBox(height: Get.height * 0.015),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: 2,
                      child: Image.network(
                        baseUrl + trip.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: 130.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(CALENDER_ICON),
                      Text(
                        trip.date!.replaceAll('-', '/'),
                        style: consttext,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.016,
                ),
                Container(
                    width: Get.width * 0.7,
                    child: Text(
                      '${trip.briefDescription}',
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
