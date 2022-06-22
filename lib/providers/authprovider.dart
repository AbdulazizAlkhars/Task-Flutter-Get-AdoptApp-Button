import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';

import '../services/authservices.dart';

class UserProvider extends ChangeNotifier {
  late User user;
  late String token;
  void signup(User user) async {
    await AuthServices().signup(user);
  }
}
