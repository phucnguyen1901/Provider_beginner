import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider_my_project/models/user_model.dart';

class AuthService {
  static Future<UserModel?> loginUser(username, password) async {
    try {
      var data = {"username": username, "password": password};
      var response =
          await Dio().post('http://172.17.0.194:3333/api/login', data: data);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        return user;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.data);
      } else {
        print("Unknown Error");
      }
    }
    return null;
  }

  static Future<bool> registerUser(fullname, username, password) async {
    try {
      var data = {
        "fullname": fullname,
        "username": username,
        "password": password
      };
      var response =
          await Dio().post('http://172.17.0.194:3333/api/register', data: data);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        return true;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.data);
      } else {
        print("Unknown Error");
      }
    }
    return false;
  }
}
