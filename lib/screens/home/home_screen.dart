import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_my_project/models/user_model.dart';
import 'package:provider_my_project/provider/user_provider.dart';
import 'package:provider_my_project/routes.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final numberPhoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    bool isSetAvatar = context.watch<UserProvider>().isSetAvatar;
    String pathAvatar = context.watch<UserProvider>().user.avatar;
    UserModel user = context.watch<UserProvider>().getUser;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 110,
                        backgroundColor: Colors.purple,
                        child: CircleAvatar(
                            radius: 100,
                            backgroundImage: isSetAvatar
                                ? FileImage(File(pathAvatar))
                                : AssetImage(pathAvatar) as ImageProvider),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 3, color: Colors.orange)),
                          child: FittedBox(
                            child: IconButton(
                                onPressed: () async {
                                  final XFile? image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    context
                                        .read<UserProvider>()
                                        .setAvatar(image.path);
                                  }
                                },
                                icon: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          user.fullname ?? "No Name",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RouteManager.loginPage);
                              // Navigator.pushNamed(context, RouteManager.loginPage);
                              // Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
                            },
                            child: Text("Logout"))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("AccessToken: ${user.accessToken}")
            ],
          ),
        ),
      ),
    );
  }
}
