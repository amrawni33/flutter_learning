import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';

class UsersScreen extends StatelessWidget {
  List<UserModel> Users = [
    UserModel(id: 1, name: 'Amr Awni', phone: '+201144498398'),
    UserModel(id: 2, name: 'Abdo Awni', phone: '+201144498398'),
    UserModel(id: 3, name: 'Ahmed Awni', phone: '+201144498398'),
    UserModel(id: 4, name: 'Mohamed Awni', phone: '+201144498398'),
    UserModel(id: 5, name: 'Mahmoud Awni', phone: '+201144498398'),
    UserModel(id: 6, name: 'Hadder Awni', phone: '+201144498398'),
    UserModel(id: 7, name: 'Mohamed Mostafa', phone: '+201144498398'),
    UserModel(id: 8, name: 'Mostafa Mohamed', phone: '+201144498398'),
    UserModel(id: 9, name: 'Hosam Eprahem', phone: '+201144498398'),
  ];

  UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Users',
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(Users[index]),
          separatorBuilder: (context, items) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: Users.length,
        ));
  }

  Widget buildUserItem(UserModel Users) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${Users.id}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(
              width: 18.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${Users.name}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Users.phone}',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
