import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayat/data/models/response/my_questions_response.dart';
import 'package:hayat/data/repository/question_repo.dart';

class MyQuestionsController extends GetxController {
  QuestionRepo questionRepo = QuestionRepo();
  MyQuestionsResponse questions = MyQuestionsResponse();
  RxBool isDataReady = false.obs;
  ScrollController scrollController = ScrollController();

  void onEndScroll() {
    int nextPage = questions.currentPage! + 1;
    print(nextPage);
    if (questions.nextPageUrl != null) {
      getOtherQuestionsRequest('$nextPage');
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

  isReady() {
    isDataReady.toggle();
    update();
  }

  getMyQuestionsRequest(String page) {
    questionRepo.getMyQuestions(page).then((value) {
      if (value.status == 200) {
        print('my questions');
        isReady();
        questions = MyQuestionsResponse.fromJson(value.data);
      }
    });
  }

  getOtherQuestionsRequest(String page) {
    MyQuestionsResponse questionsPage;
    questionRepo.getMyQuestions(page).then((value) {
      if (value.status == 200) {
        print('my questions');
        questionsPage = MyQuestionsResponse.fromJson(value.data);
        isReady();
        questions.merge(questionsPage);
      }
    });
  }
}
