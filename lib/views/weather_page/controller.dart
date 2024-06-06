import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/weather_api_response.dart';
import 'package:hayat/data/repository/weather_repo.dart';
import 'package:hayat/res/colors.dart';

class WeatherController extends GetxController {
  final pageController = PageController(initialPage: 0);
  RxInt pageIndex = 0.obs;
  WeatherRepo weatherRepo = WeatherRepo();
  Rx<Color> selectedColor = yellow.obs;
  Rx<Color> unselectedColor = white.obs;
  RxBool loading = true.obs;
  WeatherResponse weatherResponse = WeatherResponse();
  RxBool isDataReady = false.obs;

  isReady() {
    isDataReady.toggle();
    update();
  }

  isLoading() {
    if (loading.value) {
      loading.value = false;
    }
    update();
  }

  void press() {}

  moveBetweenPages(index) {
    pageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
    update();
  }

  getWeatherRequest() async {
    weatherResponse = await weatherRepo.getWeather();
    isLoading();
    return weatherResponse;
  }
}
