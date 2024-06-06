import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/data/repository/feeds_repo.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class PostReportController extends GetxController {
  RxInt selectedValue = 0.obs;
  FeedsRepo feedsRepo = FeedsRepo();
  TextEditingController reasonController = TextEditingController();
  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
  }

  void popup() {
    Get.to(
      CustomPopup(
        content: 'Report sent successfully.',
        title: 'Success',
        ontap: () {
          Get.offAllNamed('/mainPage');
        },
      ),
    );
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

  void updateSelectedValue(int value) {
    selectedValue.value = value;
    update();
  }

  postReportRequest(int id, String reason) {
    feedsRepo.reportPost(id, reason).then((value) {
      if (value.message == 'post reported') {
        isLoading();
        print(value.message);
      }
    });
  }
}
