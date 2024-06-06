import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/repository/feeds_repo.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';
import 'package:share_plus/share_plus.dart';

class FeedDetailsController extends GetxController {
  RxBool loading = false.obs;
  FeedsRepo feedsRepo = FeedsRepo();
  isLoading() {
    loading.toggle();
    update();
  }

  sharePost(int id){
    Share.share('$baseUrl/apiposts/$id');
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: mediumText,
    );
  }

  likePost(int id) {
    feedsRepo.likePost(id).then((value) {
      if (value.status == 200) {
        // likeToggle();
        print(value.message);
      }
    });
  }

  

  void popup() {
    Get.to(
      CustomPopup(
        content: 'Are you sure want to delete your post?',
        title: 'Delete Post',
        isquestion: true,
        answerontap: () {
          // feedsController.deletePost(id);
        },
      ),
    );
  }

  deletePost(int id) {
    feedsRepo.deleteMyPost(id).then((value) {
      if (value.status == 200) {
        print(value.data);
        isLoading();
      }
    });
  }
}
