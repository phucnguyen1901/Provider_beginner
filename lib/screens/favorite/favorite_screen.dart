import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_my_project/models/menu_model.dart';
import 'package:provider_my_project/provider/user_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    List<Menu> myFavorite = context.watch<UserProvider>().listFavorite;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                    child: Text(
                  "All Favorite (${myFavorite.length}) ",
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ))),
            myFavorite.length == 0
                ? Center(child: Text("Empty"))
                : Expanded(
                    child: ListView.builder(
                      itemCount: myFavorite.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                myFavorite[index].path),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "${myFavorite[index].name}\n",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 18)),
                                    TextSpan(
                                        text: "${myFavorite[index].price}\$",
                                        style: const TextStyle(
                                            color: Colors.green, fontSize: 15))
                                  ],
                                )),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<UserProvider>()
                                          .removeFromFavorite(
                                              myFavorite[index]);
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
