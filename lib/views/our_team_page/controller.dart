import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/response/team_members_response.dart';
import 'package:hayat/data/repository/page_content_repo.dart';


class OurTeamController extends GetxController{

  ScrollController scrollController = ScrollController();
  InitController initController = Get.put(InitController());
  PageRepo pageRepo = PageRepo();

  void onEndScroll() {
    int nextPage = initController.teamMembers.meta!.currentPage! + 1;
    print(nextPage);
    if (initController.teamMembers.links!.next != null) {
      // getOtherpostsRequest('$nextPage');
    }
    print('Reached end of ListView');
  }


  getOtherTeamMembersRequest(String id) async {
    TeamMembersResponse other = TeamMembersResponse();
    pageRepo.getTeamMembers(id).then((value) {
      if (value.status == 200) {
        other = TeamMembersResponse.fromJson(value.data);
        initController.teamMembers.merge(other);
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