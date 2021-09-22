class ShopLoginModel {
  bool status;
  String message;
  UserData data;

  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  // named Constructor

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    image = json['image'];
    credit = json['credit'];
    phone = json['phone'];
    points = json['points'];
  }
}
