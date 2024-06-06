import 'package:hayat/data/models/response/trip_response.dart';

class TripsResponse {
  List<TripResponse>? data;
  Links? links;
  Meta? meta;

  TripsResponse({this.data, this.links, this.meta});

  TripsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TripResponse>[];
      json['data'].forEach((v) {
        data!.add(new TripResponse.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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

  void merge(TripsResponse other) {
    data?.addAll(other.data ?? []);

    links = other.links;

    meta = other.meta;
  }
}

class Data {
  int? id;
  String? image;
  String? date;
  String? briefDescription;
  String? fullDescription;
  int? isHidden;

  Data(
      {this.id,
      this.image,
      this.date,
      this.briefDescription,
      this.fullDescription,
      this.isHidden});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    date = json['date'];
    briefDescription = json['brief_description'];
    fullDescription = json['full_description'];
    isHidden = json['is_hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['image'] = this.image;
    data['date'] = this.date;
    data['brief_description'] = this.briefDescription;
    data['full_description'] = this.fullDescription;
    data['is_hidden'] = this.isHidden;
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
        links!.add(new Links.fromJson(v));
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
