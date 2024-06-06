class TeamMemberResponse {
  int? id;
  String? fullName;
  String? picture;
  int? isHidden;

  TeamMemberResponse({this.id, this.fullName, this.picture, this.isHidden});

  TeamMemberResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    picture = json['picture'];
    isHidden = json['is_hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['picture'] = this.picture;
    data['is_hidden'] = this.isHidden;
    return data;
  }
}
