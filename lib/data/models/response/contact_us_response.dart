class ContactUsResponse {
  int? id;
  String? title;
  String? phone;
  String? email;
  String? website;
  String? image;

  ContactUsResponse(
      {this.id, this.title, this.phone, this.email, this.website, this.image});

  ContactUsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['title'] = this.title;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['website'] = this.website;
    data['image'] = this.image;
    return data;
  }
}
