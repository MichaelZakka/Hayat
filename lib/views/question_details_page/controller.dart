import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hayat/data/repository/question_repo.dart';
import 'package:hayat/res/styles.dart';

class QuestionDetailsController extends GetxController {
  QuestionRepo questionRepo = QuestionRepo();
  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
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

  deleteQuestionRequest(int id) {
    questionRepo.deleteQestion(id).then((value) {
      if (value.status == 200) {
        isLoading();
        print(value.message);
      }
    });
  }
}
