import 'package:evently/model/User.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? myUser;
  saveUser(User? newUser) {
    myUser = newUser;
    notifyListeners();
  }
}
