import 'package:flutter/material.dart';
import 'package:provider_my_project/models/user_model.dart';
import 'package:provider_my_project/provider/auth_provider.dart';
import 'package:provider_my_project/provider/login_provider/login_provider.dart';
import 'package:provider_my_project/provider/login_provider/login_state.dart';
import 'package:provider_my_project/provider/textfield_provider/textfield_provider.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginState = context.watch<LoginProvider>().loginState;
    if (loginState is LoggedInState) {
      context.read<UserProvider>().setUser(loginState.user);
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(context, RouteManager.homePage);
      });
    }

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
                  //check state
                  checkLoginState(loginState),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (loginState is LoggedInState) {
                          Navigator.pushNamed(context, RouteManager.homePage);
                        }
                        final isValidForm = formkey.currentState!.validate();
                        if (isValidForm) {
                          await context.read<LoginProvider>().loginUser(
                              usernameController.text, passwordController.text);
                        }
                      },
                      child: const Text("Login")),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.registerPage);
                      },
                      child: const Text("Register?"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget checkLoginState(state) {
  if (state is AuthenticatingState) return const CircularProgressIndicator();
  if (state is LoginFailedState) {
    return Text(state.errorMessage, style: TextStyle(color: Colors.red));
  }
  return Container();
}
