import 'package:flutter/material.dart';
import 'package:provider_my_project/provider/user_provider.dart';
import 'package:provider_my_project/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<UserProvider>(
      create: (BuildContext context) => UserProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.loginPage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
