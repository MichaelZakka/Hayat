class ImageResponse {
  int? id;
  String? originalUrl;
  bool? isHidden;

  ImageResponse({this.id, this.originalUrl, this.isHidden});

  ImageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalUrl = json['original_url'];
    isHidden = json['is_hidden'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['original_url'] = this.originalUrl;
    data['is_hidden'] = this.isHidden;
    return data;
  }
}
