import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/body/add_post_body.dart';
import 'package:hayat/data/repository/feeds_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/res/styles.dart';
import 'package:hayat/views/feeds_page/controller.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';
// import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  FeedsController feedsController = Get.find();
  TextEditingController captionController = TextEditingController();
  FeedsRepo feedsRepo = FeedsRepo();
  RxBool loading = false.obs;

  isLoading() {
    if (loading.value) {
      loading.value = false;
    }
    if (loading.value == false) {
      loading.value = true;
    }
    update();
  }

  void popup() {
    Get.to(
      CustomPopup(
        content:
            'Your post has been uploaded to your account successfully. The post will be shared with Hayat’s application after being reviewed by the admin.',
        title: ' Success',
        ontap: () {
          Get.offAllNamed('/mainPage');
        },
      ),
    );
  }

  test() {
    print(feedsController.pickedImage);
  }

  addPostRequset() {
    feedsRepo
        .addPost(AddPostBody(
            name: 'test name',
            location: 's',
            caption: captionController.text,
            image: feedsController.pickedImage))
        .then((value) {
      print(value.message);
      if (value.message == 'post created successfully') {
        print(value.message);
        isLoading();
        Get.offAllNamed('/mainPage');
      } else {
        isLoading();
        validation(value,red);
      }
    });
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
}
