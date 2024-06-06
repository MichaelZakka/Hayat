class UpdateUserBody {
  String? fullName;
  String? mobileNumber;
  String? email;

  UpdateUserBody({this.fullName, this.mobileNumber, this.email});

  UpdateUserBody.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = this.fullName;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    return data;
  }
}
