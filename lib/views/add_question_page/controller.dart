import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/models/body/add_question_body.dart';
import 'package:hayat/data/repository/question_repo.dart';
import 'package:hayat/res/colors.dart';
import 'package:hayat/widgets/popup/custom_popup.dart';

class AddQuestionController extends GetxController {
  TextEditingController questionController = TextEditingController();
  QuestionRepo questionRepo = QuestionRepo();
  InitController initController = InitController();

  RxBool loading = false.obs;

  isLoading() {
    loading.toggle();
    update();
  }

  addQuestion() {
    questionRepo
        .addQuestion(AddQuestionBody(questionText: questionController.text))
        .then((value) {
      if (value.message == 'question created successfully') {
        print(value.message);
        isLoading();
        addPopup();
      } else {
        isLoading();
        initController.validation(value.message, red);
      }
    });
  }

  setValue(String question) {
    questionController.text = question;
  }

  updateQuestionRequest(String id) {
    questionRepo
        .updateQuestion(
            AddQuestionBody(questionText: questionController.text), id)
        .then((value) {
      if (value.message == 'question has been updated successfully') {
        print(value.message);
        isLoading();
        updatePopup();
      } else {
        isLoading();
        initController.validation(value.message, red);
      }
    });
  }

  void addPopup() {
    Get.to(
      CustomPopup(
        content: 'Your question was added.We will Reply will soon.',
        title: 'Success',
        ontap: () {
          Get.offAllNamed('/mainPage');
        },
      ),
    );
  }
  void updatePopup() {
    Get.to(
      CustomPopup(
        content: 'Your question was update.We will Reply will soon.',
        title: 'Success',
        ontap: () {
          Get.offAllNamed('/mainPage');
        },
      ),
    );
  }
}
