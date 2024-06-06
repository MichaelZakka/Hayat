class TripResponse {
  int? id;
  String? image;
  String? date;
  String? briefDescription;
  String? fullDescription;
  int? isHidden;

  TripResponse(
      {this.id,
      this.image,
      this.date,
      this.briefDescription,
      this.fullDescription,
      this.isHidden});

  TripResponse.fromJson(Map<String, dynamic> json) {
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
