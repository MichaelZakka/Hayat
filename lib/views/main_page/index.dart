import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/constant/constant.dart';
import 'package:hayat/views/account_page/index.dart';
import 'package:hayat/views/feeds_page/index.dart';
import 'package:hayat/views/hayat_page/index.dart';
import 'package:hayat/views/home_page/index.dart';
import 'package:hayat/views/main_page/controller.dart';
import 'package:hayat/views/main_page/widgets/custom_naviationbar.dart';
import 'package:hayat/views/weather_page/index.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController mainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: SafeArea(
        child: SizedBox(
          height: Get.height * Constant.removeSpaces(context),
          child: PageView(
            controller: mainPageController.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomePage(),
              FeedsPage(),
              HayatPage(),
              WeatherPage(),
              AccountPage(),
            ],
          ),
        ),
      ),
    );
  }
}
