import 'package:flutter/material.dart';
import 'package:provider_my_project/bottom_navigator.dart';
import 'package:provider_my_project/screens/auth/login/login_screen.dart';
import 'package:provider_my_project/screens/auth/register/register_screen.dart';
import 'package:provider_my_project/screens/favorite/favorite_screen.dart';
import 'package:provider_my_project/screens/home/home_screen.dart';
import 'package:provider_my_project/screens/menu/menu.dart';

class RouteManager {
  static const String loginPage = '/login';
  static const String bottomNav = '/';
  static const String homePage = '/home';
  static const String shoppingPage = '/shopping';
  static const String favoritePage = '/favorite';
  static const String registerPage = '/register';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case homePage:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case shoppingPage:
        return MaterialPageRoute(builder: (context) => MenuScreen());
      case bottomNav:
        return MaterialPageRoute(builder: (context) => BottomNav());
      case favoritePage:
        return MaterialPageRoute(builder: (context) => FavoriteScreen());
      case registerPage:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      default:
    }
  }
}
