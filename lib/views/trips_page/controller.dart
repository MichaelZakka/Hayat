import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/trips_response.dart';
import 'package:hayat/data/repository/trips_repo.dart';

class TripsController extends GetxController {
  InitController initController = Get.put(InitController());
  TripsRepo tripsRepo = TripsRepo();

  ScrollController scrollController = ScrollController();

  void onEndScroll() {
    int nextPage = initController.images.meta!.currentPage! + 1;
    print(nextPage);
    if (initController.images.links!.next != null) {
      // getOtherpostsRequest('$nextPage');
    }
    print('Reached end of ListView');
  }

  getOtherTripsRequest(String id) {
    TripsResponse other =TripsResponse();
    tripsRepo.getAllTrips(id).then((value) {
      if (value.status == 200) {
        print('trips');
        initController.trips.merge(other);
      }
    });
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
