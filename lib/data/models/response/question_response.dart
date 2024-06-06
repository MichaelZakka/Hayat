class QuestionResponse {
  int? id;
  String? questionText;
  String? answer;
  String? status;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? userName;
  User? user;

  QuestionResponse(
      {this.id,
      this.questionText,
      this.answer,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.userName,
      this.user});

  QuestionResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    answer = json['answer'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userName = json['user_name'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['question_text'] = this.questionText;
    data['answer'] = this.answer;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_name'] = this.userName;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? mobileNumber;
  int? isActive;
  int? isHidden;
  int? isVerified;
  String? emailVerifiedAt;
  String? deleteAccountReasonId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.mobileNumber,
      this.isActive,
      this.isHidden,
      this.isVerified,
      this.emailVerifiedAt,
      this.deleteAccountReasonId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    isActive = json['is_active'];
    isHidden = json['is_hidden'];
    isVerified = json['is_verified'];
    emailVerifiedAt = json['email_verified_at'];
    deleteAccountReasonId = json['delete_account_reason_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['is_active'] = this.isActive;
    data['is_hidden'] = this.isHidden;
    data['is_verified'] = this.isVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['delete_account_reason_id'] = this.deleteAccountReasonId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
