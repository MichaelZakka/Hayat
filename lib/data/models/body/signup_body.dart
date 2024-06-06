class SignUpBody {
  String? fullName;
  String? email;
  String? mobileNumber;
  String? password;

  SignUpBody({this.fullName, this.email, this.mobileNumber, this.password});

  SignUpBody.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] =fullName;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['password'] = password;
    return data;
  }
}
