import 'package:hayat/data/models/response/post_response.dart';

class MyFeedsResponse {
  List<PostResponse>? data;

  MyFeedsResponse({this.data});

  MyFeedsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PostResponse>[];
      json['data'].forEach((v) {
        data!.add(new PostResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? caption;
  String? image;
  String? location;
  String? status;
  int? userId;
  int? likes;
  String? userName;
  int? likedByMe;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.caption,
      this.image,
      this.location,
      this.status,
      this.userId,
      this.likes,
      this.userName,
      this.likedByMe,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    image = json['image'];
    location = json['location'];
    status = json['status'];
    userId = json['user_id'];
    likes = json['likes'];
    userName = json['user_name'];
    likedByMe = json['liked_by_me'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['caption'] = this.caption;
    data['image'] = this.image;
    data['location'] = this.location;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['likes'] = this.likes;
    data['user_name'] = this.userName;
    data['liked_by_me'] = this.likedByMe;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
