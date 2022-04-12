import 'package:flutter/material.dart';
import 'package:provider_my_project/provider/auth_provider.dart';
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
    Status registerStatus = context.watch<AuthProvider>().registerStatus;
    String errorMessage = context.watch<AuthProvider>().showErrorMessage;

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
                checkStatusRegister(context, registerStatus, errorMessage),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final isValidForm = formkey.currentState!.validate();
                      if (isValidForm) {
                        await context.read<AuthProvider>().registerUser(
                            fullNameController.text,
                            usernameController.text,
                            passwordController.text);
                      }
                    },
                    child: Text("Register")),
                TextButton(
                    onPressed: () {
                      context.read<AuthProvider>().reset();
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

  Widget checkStatusRegister(BuildContext context, Status stt, String error) {
    switch (stt) {
      case Status.Registered:
        return ElevatedButton(
            onPressed: () {
              context.read<AuthProvider>().reset();
              Navigator.pushNamed(context, RouteManager.loginPage);
            },
            child: const Text(
              "Registered Successfully",
            ));
      case Status.Registering:
        return CircularProgressIndicator();
      case Status.RegistrationFailed:
        return Text(
          error,
          style: TextStyle(color: Colors.red),
        );

      default:
        return Container();
    }
  }
}
