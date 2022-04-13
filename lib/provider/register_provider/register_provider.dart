import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_my_project/provider/register_provider/register_state.dart';

class RegisterProvider with ChangeNotifier {
  RegisterScreenState _registerScreenState = NotRegisterState();

  get registerScreenState => _registerScreenState;

  Future<void> registerUser(fullname, username, password) async {
    _registerScreenState = RegisteringState();
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    try {
      var data = {
        "fullname": fullname,
        "username": username,
        "password": password
      };

      BaseOptions options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 3000,
      );
      var response = await Dio(options)
          .post('http://172.17.0.194:3333/api/register', data: data);
      if (response.statusCode == 200) {
        _registerScreenState = RegisteredState();
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
        case DioErrorType.response:
          messageError = "Username already exists";
          break;
        case DioErrorType.cancel:
          messageError = "Cancle";
          break;
        default:
          messageError = "Internal Server Error";
      }
      _registerScreenState = RegistrationFailedState(messageError);
      notifyListeners();
    }
  }
}
