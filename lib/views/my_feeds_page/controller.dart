import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/my_feeds_response.dart';
import 'package:hayat/data/repository/feeds_repo.dart';

class MyFeedsController extends GetxController {
  ScrollController _scrollController = ScrollController();
  FeedsRepo feedsRepo = FeedsRepo();
  MyFeedsResponse myFeed = MyFeedsResponse();
  RxBool isDataReady = false.obs;

  void startAutoScroll() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  isReady() {
    isDataReady.toggle();
    update();
  }

  myFeedRequest() {
    feedsRepo.getMyFeeds().then((value) {
      if (value.status == 200) {
        print('==========================00');
        print('myfeeds');
        isReady();
        myFeed = MyFeedsResponse.fromJson(value.data);
      }
    });
  }
}
