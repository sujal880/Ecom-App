class SignUpModel {
  String? message;
  Data? data;

  SignUpModel({this.message, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? password;
  String? username;
  String? sId;
  int? iV;

  Data({this.email, this.password, this.username, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
