import 'package:flutter/material.dart';
import 'package:provider_my_project/bottom_navigator.dart';
import 'package:provider_my_project/provider/login_provider/login_provider.dart';
import 'package:provider_my_project/provider/navigation_provider.dart';
import 'package:provider_my_project/provider/register_provider/register_provider.dart';
import 'package:provider_my_project/provider/textfield_provider/textfield_provider.dart';
import 'package:provider_my_project/provider/user_provider.dart';
import 'package:provider_my_project/screens/auth/login/login_screen.dart';
import 'package:provider_my_project/screens/auth/register/register_screen.dart';
import 'package:provider_my_project/screens/favorite/favorite_screen.dart';
import 'package:provider_my_project/screens/home/home_screen.dart';
import 'package:provider_my_project/screens/menu/menu.dart';
import 'package:provider/provider.dart';

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
        return MaterialPageRoute(
            builder: (context) => MultiProvider(providers: [
                  ChangeNotifierProvider<LoginProvider>(
                      create: (BuildContext context) => LoginProvider()),
                  ChangeNotifierProvider<TextFieldProvider>(
                      create: (BuildContext context) => TextFieldProvider()),
                ], child: const LoginScreen()));
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case shoppingPage:
        return MaterialPageRoute(builder: (context) => const MenuScreen());
      case bottomNav:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<NavigationProvider>(
                create: (BuildContext context) => NavigationProvider(),
                child: const BottomNav()));
      case favoritePage:
        return MaterialPageRoute(builder: (context) => const FavoriteScreen());
      case registerPage:
        return MaterialPageRoute(
            builder: (context) => MultiProvider(providers: [
                  ChangeNotifierProvider<RegisterProvider>(
                      create: (BuildContext context) => RegisterProvider()),
                  ChangeNotifierProvider<TextFieldProvider>(
                      create: (BuildContext context) => TextFieldProvider()),
                ], child: const RegisterScreen()));
      default:
    }
  }
}
