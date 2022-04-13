class RegisterScreenState {}

class NotRegisterState extends RegisterScreenState {}

class RegisteringState extends RegisterScreenState {}

class RegisteredState extends RegisterScreenState {}

class RegistrationFailedState extends RegisterScreenState {
  String errorMessage;
  RegistrationFailedState(this.errorMessage);
}
