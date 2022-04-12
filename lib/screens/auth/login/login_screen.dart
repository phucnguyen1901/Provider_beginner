import 'package:flutter/material.dart';
import 'package:provider_my_project/models/user_model.dart';
import 'package:provider_my_project/provider/auth_provider.dart';
import 'package:provider_my_project/provider/user_provider.dart';
import 'package:provider_my_project/routes.dart';
import 'package:provider_my_project/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_my_project/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Status loginStatus = context.watch<AuthProvider>().loginStatus;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldUsernameUser(usernameController: usernameController),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldPasswordUser(passwordController: passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  loginStatus == Status.Authenticating
                      ? CircularProgressIndicator()
                      : loginStatus == Status.LoggInFailed
                          ? const Text(
                              "Login Failed",
                              style: TextStyle(color: Colors.red),
                            )
                          : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final isValidForm = formkey.currentState!.validate();
                        if (isValidForm) {
                          var user = await context
                              .read<AuthProvider>()
                              .loginUser(usernameController.text,
                                  passwordController.text);

                          if (user['status'] == 200) {
                            context.read<UserProvider>().setUser(user['data']);
                            Navigator.pushNamed(
                                context, RouteManager.bottomNav);
                          } else {
                            print("Login Failed");
                          }
                        }
                      },
                      child: Text("Login")),
                  TextButton(onPressed: () {
                    Navigator.pushNamed(context, RouteManager.registerPage);
                  }, child: Text("Register?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
