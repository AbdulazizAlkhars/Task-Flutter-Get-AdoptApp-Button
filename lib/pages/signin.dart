import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/providers/authprovider.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Username = TextEditingController();
    var Password = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("SigIn"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: Username,
            // style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              hintText: 'Username',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: Password,
              obscureText: true,
              // style: const TextStyle(fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Password',
              )),
        ),
        ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().signup(
                  User(username: Username.text, password: Password.text));
              context.pop();
            },
            child: const Text("SignIn"),
            style: ElevatedButton.styleFrom())
      ]),
    );
  }
}
