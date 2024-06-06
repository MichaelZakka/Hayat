import 'package:get/get.dart';
import 'package:hayat/controller/init_controller.dart';
import 'package:hayat/data/constant/api_constant.dart';
import 'package:hayat/data/http/http_client.dart';
import 'package:hayat/data/models/body/add_question_body.dart';

class QuestionRepo {
  InitController initController = Get.find();
  MyHttpClient http = MyHttpClient();

  addQuestion(AddQuestionBody addQuestionBody) async {
    print(initController.userData!.token);
    return await http.postRequest(ADD_QUESTION, addQuestionBody.toJson(), {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  updateQuestion(AddQuestionBody addQuestionBody, String id) async {
    print(initController.userData!.token);
    return await http.putRequest('$ADD_QUESTION/$id', addQuestionBody.toJson(), {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  getMyQuestions(String page) async {
    return await http.getRequest('$MY_QUETIONS/?page=$page', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }

  deleteQestion(int id) async {
    return await http.deleteRequest('$ADD_QUESTION/$id', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.userData!.token}"
    });
  }
}
