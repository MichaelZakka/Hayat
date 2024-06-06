import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/weather_page/controller.dart';
import 'package:hayat/views/weather_page/widgets/custom_weather_widget.dart';

class WeatherForecastPage extends StatelessWidget {
  WeatherForecastPage({super.key});
  final WeatherController weatherController = Get.find();
  final InitController initController = Get.put(InitController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(builder: (_) {
      // weatherController.getWeatherRequest();
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.054),
            SvgPicture.asset(WEATHER_ICON),
            SizedBox(height: Get.height * 0.054),
            weatherController.loading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: blue1,
                    ),
                  )
                : CustomWeatherWidget(
                    weatherResponse: weatherController.weatherResponse,
                  ),
            SizedBox(height: Get.height * 0.05),
            SizedBox(
              width: Get.width * 0.86,
              child: Text(
                '${initController.pages.data![5].content}',
                style: mediumtext,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
          ],
        ),
      );
    });
  }
}