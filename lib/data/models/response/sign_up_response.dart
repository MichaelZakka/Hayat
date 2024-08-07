class SignUpResponse{
  String? fullName;
  String? email;
  String? mobileNumber;
  String? updatedAt;
  String? createdAt;
  int? id;

  SignUpResponse(
      {this.fullName,
      this.email,
      this.mobileNumber,
      this.updatedAt,
      this.createdAt,
      this.id});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
