import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/providers/authprovider.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class AddUser extends StatelessWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var addUsername = TextEditingController();
    var addPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("SigUp"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: addUsername,
            // style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: addPassword,
              obscureText: true,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Password',
              )),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().signup(
                  User(username: addUsername.text, password: addPassword.text));
              context.pop();
            },
            child: const Text("SignUp"),
            style: ElevatedButton.styleFrom())
      ]),
    );
  }
}
