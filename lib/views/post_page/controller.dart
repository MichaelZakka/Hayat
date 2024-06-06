import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/models/response/post_response.dart';
import 'package:hayat/data/repository/feeds_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:share_plus/share_plus.dart';

class PostController extends GetxController {
  FeedsController feedsController = Get.put(FeedsController());
  Color? color = blue1;
  FeedsRepo feedsRepo = FeedsRepo();
  Color likeColor = blue1;
  Color unlikeColor = Colors.grey;


  getColor(int id) {
    PostResponse post =
        feedsController.feeds.data!.where((post) => post.id == id).toList()[0];
    if (post.likedByMe == 1) {
      return likeColor;
    } else if (post.likedByMe == 0) {
      return unlikeColor;
    }
    update();
  }

  likeToggle() {
    if (color == blue1) {
      color = Colors.grey;
    } else if (color == Colors.grey) {
      color = blue1;
    }
    update();
  }

  sharePost(int id) {
    Share.share('$baseUrl/apiposts/$id');
  }

  likePost(int id) {
    feedsRepo.likePost(id).then((value) {
      if (value.status == 200) {
        // likeToggle();
        print(value.message);
      }
    });
  }
}
