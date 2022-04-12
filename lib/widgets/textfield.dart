import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_my_project/provider/auth_provider.dart';

class TextFieldPasswordUser extends StatelessWidget {
  const TextFieldPasswordUser({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    bool isShowPassword = context.watch<AuthProvider>().checkShowPassword;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
              controller: passwordController,
              validator: (value) {
                // String pattern = r'^(?:[+0])?[0-9]{5}$';
                // RegExp regExp = new RegExp(pattern);
                if (value!.trim().isEmpty) {
                  return "Please enter your password";
                }
              },
              obscureText: isShowPassword,
              // onSaved: (value) => numberPhone = value!,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                    context.read<AuthProvider>().setShowPassword();
                  }, icon: isShowPassword ? Icon(Icons.visibility_off): Icon(Icons.visibility)),
                  enabledBorder:  const OutlineInputBorder(
                          borderRadius:  BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder:  const OutlineInputBorder(
                          borderRadius:  BorderRadius.all(const Radius.circular(20)),
                          borderSide:  BorderSide(color: Colors.blue)))),
        ),

      ],
    );
  }
}

class TextFieldUsernameUser extends StatelessWidget {
  const TextFieldUsernameUser({
    Key? key,
    required this.usernameController,
  }) : super(key: key);

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Please enter your username";
                }
                return null;
              },
              // onSaved: (value) => name = value!,
              decoration: const  InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder:   OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue)))),
        ),

      ],
    );
  }
}


class TextFieldFullNameUser extends StatelessWidget {
  const TextFieldFullNameUser({
    Key? key,
    required this.fullNameController,
  }) : super(key: key);

  final TextEditingController fullNameController;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: TextFormField(
              controller: fullNameController,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return "Please enter your full name";
                }
                return null;
              },
              // onSaved: (value) => name = value!,
              decoration: const  InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.purple)),
                  focusedBorder:   OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.blue)))),
        ),

      ],
    );
  }
}
