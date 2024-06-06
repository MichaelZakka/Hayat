class AddPostBody {
  String? name;
  String? caption;
  String? location;
  String? image;

  AddPostBody({this.name, this.caption, this.location, this.image});

  AddPostBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caption = json['caption'];
    location = json['location'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['location'] = this.location;
    data['image'] = this.image;
    return data;
  }
}