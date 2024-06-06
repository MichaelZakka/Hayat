class SponserResponse {
  int? id;
  String? logo;
  String? name;
  int? isHidden;

  SponserResponse({this.id, this.logo, this.name, this.isHidden});

  SponserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    name = json['name'];
    isHidden = json['is_hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['is_hidden'] = this.isHidden;
    return data;
  }
}
