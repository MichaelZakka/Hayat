class AddQuestionBody {
  String? questionText;

  AddQuestionBody({this.questionText});

  AddQuestionBody.fromJson(Map<String, dynamic> json) {
    questionText = json['question_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_text'] = questionText;
    return data;
  }
}