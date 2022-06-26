import 'package:adopt_app/models/pet.dart';
import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/pets_services.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

import '../services/authservices.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  String token = "";
  void signup(User user) async {
    token = await AuthServices().signup(user);
    notifyListeners();
  }

  void signin(User user) async {
    token = await AuthServices().signin(user);
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson(Jwt.parseJwt(token));
      return true;
    } else {
      return false;
    }
  }

  void logOut() {
    token = "";
    notifyListeners();
  }
}
