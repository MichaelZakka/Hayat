class Header {
  static String? accept;
  static String? contentType;
  static String? authorization;

  Header.fromJson(Map<String, dynamic> json) {
    accept = json['Accept'];
    contentType = json['Content-Type'];
    authorization = json['Authorization'];
  }

  static Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['Accept'] = accept;
    data['Content-Type'] = contentType;
    data['Authorization'] = authorization;
    return data;
  }
}
