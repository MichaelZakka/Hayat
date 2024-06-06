import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final pageController = PageController(initialPage: 0);

  RxInt pageIndex = 0.obs;

  moveBetweenPages(index) {
    pageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
    update();
  }
}
