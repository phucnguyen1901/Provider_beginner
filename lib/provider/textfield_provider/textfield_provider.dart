


import 'package:flutter/material.dart';

class TextFieldProvider with ChangeNotifier{
  bool _isShowPassword = true;

  bool get showPassword => _isShowPassword;

  void setShowPassword() {
    _isShowPassword = !_isShowPassword;
    notifyListeners();
  }
  
}















