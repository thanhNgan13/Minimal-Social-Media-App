import 'package:flutter/material.dart';
import 'package:minimal_social_media_app/models/UserModel.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
