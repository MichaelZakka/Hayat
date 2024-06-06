class LoginResponse {
  User? user;
  String? token;

  LoginResponse({this.user, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json["user"] != null ?  User.fromJson(json["user"]) : null;
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.user != null) {
      data["user"] = this.user!.toJson();
    }
    data["token"] = this.token;
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
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullName = json["full_name"];
    email = json["email"];
    mobileNumber = json["mobile_number"];
    isActive = json["is_active"];
    isHidden = json["is_hidden"];
    isVerified = json["is_verified"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["full_name"] = this.fullName;
    data["email"] = this.email;
    data["mobile_number"] = this.mobileNumber;
    data["is_active"] = this.isActive;
    data["is_hidden"] = this.isHidden;
    data["is_verified"] = this.isVerified;
    data["created_at"] = this.createdAt;
    data["updated_at"] = this.updatedAt;
    return data;
  }
}