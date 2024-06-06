import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/all_plants_response.dart';
import 'package:hayat/data/repository/plants_repo.dart';

class ByLettersController extends GetxController {
  ScrollController scrollController = ScrollController();
  PlantsRepo plantsRepo = PlantsRepo();
  AllPlantsResponse plantsByLetter = AllPlantsResponse();
  RxBool isDataReady = false.obs;



  

  isReady() {
    isDataReady.toggle();
    update();
  }

  getPlantsByLetterRequest(String page) {
    plantsRepo.getPlantsByLetter(page).then((value) {
      if (value.status == 200) {
        print(value.data);
        isReady();
        plantsByLetter = AllPlantsResponse.fromJson(value.data);
      }
    });
  }

  getOtherPlantsByLetterRequest(String page) async {
    AllPlantsResponse plantPage;
    plantsRepo.getPlantsByLetter(page).then((value) {
      if (value.status == 200) {
        plantPage = AllPlantsResponse.fromJson(value.data);
        plantsByLetter.merge(plantPage);
        update();
      }
    });
  }

  void onEndScroll() {
    int nextPage = plantsByLetter.meta!.currentPage! + 1;
    print(nextPage);
    if (plantsByLetter.links!.next != null) {
      getOtherPlantsByLetterRequest('$nextPage');
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
}
