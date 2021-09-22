import 'package:flutter/cupertino.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({
    @required this.phone,
    @required this.id,
    @required this.name,
  });
}
