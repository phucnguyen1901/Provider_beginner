import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_my_project/models/user_model.dart';
import 'package:provider_my_project/provider/login_provider/login_state.dart';

class LoginProvider with ChangeNotifier {
  LoginScreenState _loginState = NotLoginState();
  get loginState => _loginState;

  Future<void> loginUser(username, password) async {
    _loginState = AuthenticatingState();
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    try {
      var data = {"username": username, "password": password};
      BaseOptions options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      var response = await Dio(options)
          .post('http://172.17.0.194:3333/api/login', data: data);

      if (response.statusCode == 200) {
        UserModel user = UserModel.fromJson(response.data);
        _loginState = LoggedInState(user);
        notifyListeners();
      }
    } on DioError catch (e) {
      String messageError = "";
      switch (e.type) {
        case DioErrorType.connectTimeout:
          messageError = "Not Connect Server";
          break;
        case DioErrorType.receiveTimeout:
          messageError = "Receive Timeout";
          break;
        case DioErrorType.other:
          messageError = "Unknown Error";
          break;
        default:
          messageError = "Internal Server Error";
      }

      _loginState = LoginFailedState(messageError);
      notifyListeners();
    }
  }
}
