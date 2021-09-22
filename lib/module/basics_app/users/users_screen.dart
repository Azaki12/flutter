import 'package:flutter/material.dart';
import 'package:login/model/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  // list (array) of users

  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Ahmed Zaki',
      phone: '01020411750',
    ),
    UserModel(
      id: 2,
      name: 'Hossam Zaki',
      phone: '01020',
    ),
    UserModel(
      id: 3,
      name: 'Mazen Zaki',
      phone: '0411750',
    ),
    UserModel(
      id: 4,
      name: 'Ali Zaki',
      phone: '01020750',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Zaki',
      phone: '01020411750',
    ),
    UserModel(
      id: 2,
      name: 'Hossam Zaki',
      phone: '01020',
    ),
    UserModel(
      id: 3,
      name: 'Mazen Zaki',
      phone: '0411750',
    ),
    UserModel(
      id: 4,
      name: 'Ali Zaki',
      phone: '01020750',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Zaki',
      phone: '01020411750',
    ),
    UserModel(
      id: 2,
      name: 'Hossam Zaki',
      phone: '01020',
    ),
    UserModel(
      id: 3,
      name: 'Mazen Zaki',
      phone: '0411750',
    ),
    UserModel(
      id: 4,
      name: 'Ali Zaki',
      phone: '01020750',
    ),
    UserModel(
      id: 1,
      name: 'Ahmed Zaki',
      phone: '01020411750',
    ),
    UserModel(
      id: 2,
      name: 'Hossam Zaki',
      phone: '01020',
    ),
    UserModel(
      id: 3,
      name: 'Mazen Zaki',
      phone: '0411750',
    ),
    UserModel(
      id: 4,
      name: 'Ali Zaki',
      phone: '01020750',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
