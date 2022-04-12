import 'package:flutter/material.dart';
import 'package:provider_my_project/models/menu_model.dart';
import 'package:provider_my_project/models/user_model.dart';

class UserProvider with ChangeNotifier {
  bool isSetAvatar = false;
  UserModel user = UserModel();
  UserModel get getUser => user;
  bool get checkSetAvatar => isSetAvatar;
  int get countFavorite => user.favorite.length;
  List<Menu> get listFavorite => user.favorite;

  setUser(newUser){
    user = newUser;
  }

  void setAvatar(newAvatar) {
    user.changeAvatar = newAvatar;
    isSetAvatar = true;
    notifyListeners();
  }

  void addToFavorite(item) {
    user.addToFavorite = item;
    notifyListeners();
  }

  void removeFromFavorite(item) {
    user.removeFromFavorite = item;
    notifyListeners();
  }
}
