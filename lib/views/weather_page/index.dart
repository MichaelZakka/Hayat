import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hayat/res/app_images.dart';
import 'package:hayat/views/climate_page/index.dart';
import 'package:hayat/views/location_page/index.dart';
import 'package:hayat/views/weather_forecast_page/index.dart';
import 'package:hayat/views/weather_page/controller.dart';
import 'package:hayat/views/weather_page/widgets/weather_navigation_bar.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});
  final WeatherController weathereController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: Get.height,
                child: SvgPicture.asset(
                  width: Get.width,
                  BLUE_BACKGROUND6,
                  fit: BoxFit.cover,
                )),
            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    // IconButton(
                    //     onPressed: () {
                    //       weathereController.getWeatherRequest();
                    //     },
                    //     icon: Icon(Icons.abc)),
                    SizedBox(height: Get.height * 0.05),
                    WeatherNavigationBar(),
                    SizedBox(height: Get.height * 0.025),
                    Expanded(
                      child: PageView(
                        controller: weathereController.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children:  [
                          WeatherForecastPage(),
                          ClimatePage(),
                          LocationPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
