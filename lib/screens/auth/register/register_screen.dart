import 'package:flutter/material.dart';
import 'package:provider_my_project/provider/auth_provider.dart';
import 'package:provider_my_project/provider/register_provider/register_provider.dart';
import 'package:provider_my_project/provider/register_provider/register_state.dart';
import 'package:provider_my_project/routes.dart';
import 'package:provider_my_project/widgets/textfield.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterScreenState registerState =
        context.watch<RegisterProvider>().registerScreenState;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldFullNameUser(
                  fullNameController: fullNameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldUsernameUser(usernameController: usernameController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldPasswordUser(passwordController: passwordController),
                const SizedBox(
                  height: 20,
                ),
                checkLoginState(registerState, context),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final isValidForm = formkey.currentState!.validate();
                      if (isValidForm) {
                        await context.read<RegisterProvider>().registerUser(
                            fullNameController.text,
                            usernameController.text,
                            passwordController.text);
                      }
                    },
                    child: Text("Register")),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteManager.loginPage);
                    },
                    child: Text("Login?"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget checkLoginState(state, context) {
  if (state is RegisteringState) return const CircularProgressIndicator();
  if (state is RegisteredState) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteManager.loginPage);
        },
        child: const Text(
          "Registered Successfully",
        ));
  }
  if (state is RegistrationFailedState) {
    return Text(state.errorMessage, style: TextStyle(color: Colors.red));
  }
  return Container();
}
