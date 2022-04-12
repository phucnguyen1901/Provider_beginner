import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_my_project/models/user_model.dart';
import 'package:provider_my_project/routes.dart';
import 'package:provider_my_project/service/auth_service.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  LoggInFailed,
  Registered,
  RegistrationFailed,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider with ChangeNotifier {
  bool isShowPassword = true;
  Status loginStatus = Status.NotLoggedIn;
  Status registerStatus = Status.NotRegistered;
  String errorMessage = "";

  get checkShowPassword => isShowPassword;
  get showErrorMessage => errorMessage;

  void setShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void reset(){
    registerStatus = Status.NotRegistered;
    loginStatus = Status.NotLoggedIn;
    errorMessage = "";
    notifyListeners();
  }

  Future<Map> loginUser(username, password) async {
    loginStatus = Status.Authenticating;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    try {
      var data = {"username": username, "password": password};
      var response =
          await Dio().post('http://172.17.0.194:3333/api/login', data: data);
      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        loginStatus = Status.LoggedIn;
        notifyListeners();
        return {"status": 200, "data": user};
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.data);
      } else {
        print("Unknown Error");
      }

      loginStatus = Status.LoggInFailed;
      notifyListeners();
    }
    return {"status": 404};
  }

  Future<void> registerUser(fullname, username, password) async {
    registerStatus = Status.Registering;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
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
        registerStatus = Status.Registered;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.data);
        errorMessage = "Not Found Api";
      } else {

        print("Unknown Error: ${e.response!.statusCode}");
        errorMessage = "Unknown Error";
      }
      registerStatus = Status.RegistrationFailed;
      notifyListeners();
    }
  }
}
