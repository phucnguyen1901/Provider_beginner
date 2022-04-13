import 'package:provider_my_project/models/user_model.dart';

class LoginScreenState {}

class NotLoginState extends LoginScreenState {}

class AuthenticatingState extends LoginScreenState {}

class LoggedInState extends LoginScreenState {
    UserModel user;
    LoggedInState(this.user);
}

class LoginFailedState extends LoginScreenState {
  String errorMessage;
  LoginFailedState(this.errorMessage);
}


