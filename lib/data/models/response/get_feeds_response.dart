import 'package:hayat/data/models/response/post_response.dart';

class GetFeedsResponse {
  List<PostResponse>? data;
  Links? links;
  Meta? meta;

  GetFeedsResponse({this.data, this.links, this.meta});

  GetFeedsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PostResponse>[];
      json['data'].forEach((v) {
        data!.add(PostResponse.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }

  void merge(GetFeedsResponse other) {
    data?.addAll(other.data ?? []);

    links = other.links;

    meta = other.meta;
  }
}

class Data {
  int? id;
  String? name;
  String? caption;
  String? image;
  String? location;
  String? status;
  int? userId;
  int? likes;
  Null userName;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.name,
      this.caption,
      this.image,
      this.location,
      this.status,
      this.userId,
      this.likes,
      this.userName,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    caption = json['caption'];
    image = json['image'];
    location = json['location'];
    status = json['status'];
    userId = json['user_id'];
    likes = json['likes'];
    userName = json['user_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['image'] = this.image;
    data['location'] = this.location;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['likes'] = this.likes;
    data['user_name'] = this.userName;
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
  Null emailVerifiedAt;
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class LinksInsideMeta {
  String? url;
  String? label;
  bool? active;

  LinksInsideMeta({this.url, this.label, this.active});

  LinksInsideMeta.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
