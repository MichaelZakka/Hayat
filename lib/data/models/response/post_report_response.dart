class PostReportResponse {
  int? userId;
  int? postId;
  String? reason;
  String? updatedAt;
  String? createdAt;
  int? id;

  PostReportResponse(
      {this.userId,
      this.postId,
      this.reason,
      this.updatedAt,
      this.createdAt,
      this.id});

  PostReportResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    postId = json['post_id'];
    reason = json['reason'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['reason'] = this.reason;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
