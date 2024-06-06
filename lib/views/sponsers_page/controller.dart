import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/sponsers_response.dart';
import 'package:hayat/data/repository/page_content_repo.dart';

class SponsersController extends GetxController {
  InitController initController = Get.put(InitController());
  ScrollController scrollController = ScrollController();
  PageRepo pageRepo = PageRepo();

  void onEndScroll() {
    int nextPage = initController.sponsers.meta!.currentPage! + 1;
    print(nextPage);
    if (initController.sponsers.links!.next != null) {
    }
    print('Reached end of ListView');
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        onEndScroll();
      }
    });
  }


getOthersponsersRequest(String id) async {
    SponsersResponse other =SponsersResponse();
    pageRepo.getTeamMembers(id).then((value) {
      if (value.status == 200) {
        other = SponsersResponse.fromJson(value.data);
        initController.sponsers.merge(other);
      }
    });
  }
}
