import 'package:provider_my_project/models/menu_model.dart';

class UserModel {
  String? id;
  String? fullname;
  String? username;
  bool? admin;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String avatar = "assets/images/avatar.png";
  List<Menu> favorite = [];

  UserModel(
      {this.id,
      this.fullname,
      this.username,
      this.admin,
      this.createdAt,
      this.updatedAt,
      this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    admin = json['admin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['admin'] = this.admin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['accessToken'] = this.accessToken;
    return data;
  }

  set changeAvatar(newAvatar) {
    avatar = newAvatar;
  }

  set addToFavorite(item) {
    favorite.add(item);
  }

  set removeFromFavorite(item) {
    favorite.remove(item);
  }
}
