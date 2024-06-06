import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/weather_api_response.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';

class CustomWeatherWidget extends StatelessWidget {
  final WeatherResponse weatherResponse;
  CustomWeatherWidget({required this.weatherResponse, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.86,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: lightcyan3),
      child: Center(
        child: SizedBox(
          width: Get.width * 0.75,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text(
                      '${weatherResponse.location!.localtime}',
                      style: consttex2,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text(
                      '${weatherResponse.current!.tempC}',
                      style: TextStyle(
                          color: yellow,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text(
                      '${weatherResponse.current!.tempF}',
                      style: TextStyle(
                          color: white,
                          fontFamily: 'Poppins',
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text('${weatherResponse.location!.region}',
                        style: titles),
                  ),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Text('${weatherResponse.current!.condition!.text}',
                        style: mediumtext),
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  )
                ],
              ),
              // Image.network('${weatherResponse.current!.condition!.icon}')
            ],
          ),
        ),
      ),
    );
  }
}
