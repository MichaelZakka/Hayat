import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/views/weather_page/controller.dart';
import 'package:hayat/widgets/buttons/auth_custom_botton.dart';

class WeatherNavigationBar extends StatelessWidget {
  WeatherNavigationBar({super.key});

  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(builder: (_) {
      return SizedBox(
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 15.r,
            ),
            Expanded(
              flex: 1,
              child: AuthButton(
                width: MediaQuery.of(context).size.width > 450 ? 200.r : 125.r,
                containercolor: _.pageIndex.value == 0
                    ? _.selectedColor.value
                    : _.unselectedColor.value,
                text: 'Weather',
                textcolor: black,
                ontap: () {
                  weatherController.moveBetweenPages(0);
                  // _.press();
                },
              ),
            ),
            SizedBox(
              width: 15.r,
            ),
            Expanded(
              flex: 1,
              child: AuthButton(
                width: MediaQuery.of(context).size.width > 450 ? 200.r : 125.r,
                containercolor: _.pageIndex.value == 1
                    ? _.selectedColor.value
                    : _.unselectedColor.value,
                text: 'Climate',
                textcolor: black,
                ontap: () {
                  weatherController.moveBetweenPages(1);
                },
              ),
            ),
            SizedBox(
              width: 15.r,
            ),
            Expanded(
              flex: 1,
              child: AuthButton(
                width: MediaQuery.of(context).size.width > 450 ? 200.r : 125.r,
                containercolor: _.pageIndex.value == 2
                    ? _.selectedColor.value
                    : _.unselectedColor.value,
                text: 'Location',
                textcolor: black,
                ontap: () {
                  weatherController.moveBetweenPages(2);
                },
              ),
            ),
            SizedBox(
              width: 15.r,
            ),
          ],
        ),
      );
    });
  }
}
