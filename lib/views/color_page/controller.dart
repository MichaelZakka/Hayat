import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/all_plants_response.dart';
import 'package:hayat/data/models/response/plant_response.dart';
import 'package:hayat/data/repository/plants_repo.dart';

class ColorController extends GetxController {
  PlantsRepo plantsRepo = PlantsRepo();
  AllPlantsResponse plants = AllPlantsResponse();
  RxBool loading = true.obs;
  ScrollController scrollController = ScrollController();
  RxBool isDataReady = false.obs;

  isReady() {
    isDataReady = true.obs;
    update();
  }

  void onEndScroll() {
    int nextPage = plants.meta!.currentPage! + 1;
    print(nextPage);
    if (plants.links!.next != null) {
      getOtherPlantsRequest('$nextPage', null, null);
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

  isLoading() {
    if (loading.value) {
      loading.value = false;
    }
    update();
  }

  getAllPlantsRequest(String page, int? id, String? search) async {
    plantsRepo.getAllPlants(page, id, search).then((value) {
      if (value.status == 200) {
        plants = AllPlantsResponse.fromJson(value.data);
        // isLoading();
        isReady();
      }
    });
  }

  getOtherPlantsRequest(String page, int? id, String? search) async {
    AllPlantsResponse plantPage;
    plantsRepo.getAllPlants(page, id, search).then((value) {
      if (value.status == 200) {
        plantPage = AllPlantsResponse.fromJson(value.data);
        plants.merge(plantPage);
        print(plants.data!.length);

        isLoading();
      }
    });
  }

  getPlantById(int id) {
    plantsRepo.getPlantById(id).then((value) async {
      if (value.status == 200) {
        print(value.data);
        return  PlantResponse.fromJson(value.data);
      }
    });
  }
}
