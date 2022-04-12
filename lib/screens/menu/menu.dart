import 'package:flutter/material.dart';
import 'package:provider_my_project/models/menu_model.dart';
import 'package:provider_my_project/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_my_project/screens/menu/data_menu.dart';

// class MenuScreen extends StatefulWidget {
//   const MenuScreen({Key? key}) : super(key: key);

//   @override
//   State<MenuScreen> createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {

//   @override
//   Widget build(BuildContext context) {
//     List<Menu> myFavorite = context.watch<UserProvider>().listFavorite;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 50,
//               child: const Center(
//                   child: Text(
//                 "All Items",
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               )),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20),
//                   itemCount: menu.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     print("BUILD ROI");
//                     print("this my : ${myFavorite}");
//                     print("this my : ${myFavorite.contains(menu[2])}");
//                     if (myFavorite.contains(menu[index])) {
//                       print("Vi tri chua: $index");
//                     }
//                     return Card(
//                       elevation: 5,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       shadowColor: Colors.pink,
//                       // child: Column(children: [Image.network(menu[index].path)]),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           ClipRRect(
//                             borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(20),
//                                 topRight: Radius.circular(20)),
//                             child: Container(
//                               height: 120,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                   color: Colors.red,
//                                   image: DecorationImage(
//                                       image: NetworkImage(menu[index].path),
//                                       fit: BoxFit.fitWidth)),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 RichText(
//                                     text: TextSpan(children: [
//                                   TextSpan(
//                                       text: "${menu[index].name} \n",
//                                       style: TextStyle(color: Colors.black)),
//                                   TextSpan(
//                                       text: "${menu[index].price}\$",
//                                       style: TextStyle(color: Colors.green)),
//                                 ])),
//                                 myFavorite.contains(menu[index])
//                                     ? GestureDetector(
//                                         onTap: () {
//                                           context
//                                               .read<UserProvider>()
//                                               .removeFromFavorite(menu[index]);
//                                           print(
//                                               'Remove myFavorite: $myFavorite');
//                                         },
//                                         child: const Icon(
//                                           Icons.favorite,
//                                           color: Colors.red,
//                                         ))
//                                     : GestureDetector(
//                                         onTap: () {
//                                           context
//                                               .read<UserProvider>()
//                                               .addToFavorite(menu[index]);
//                                           print(
//                                               'Add TO myFavorite: $myFavorite');
//                                         },
//                                         child: const Icon(Icons.favorite))
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Menu> myFavorite = context.watch<UserProvider>().listFavorite;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: const Center(
                  child: Text(
                "All Items",
                style: TextStyle(
                  fontSize: 24,
                ),
              )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: menu.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      shadowColor: Colors.pink,
                      // child: Column(children: [Image.network(menu[index].path)]),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                      image: NetworkImage(menu[index].path),
                                      fit: BoxFit.fitWidth)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "${menu[index].name} \n",
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: "${menu[index].price}\$",
                                      style: TextStyle(color: Colors.green)),
                                ])),
                                myFavorite.contains(menu[index])
                                    ? GestureDetector(
                                        onTap: () {
                                          context
                                              .read<UserProvider>()
                                              .removeFromFavorite(menu[index]);
                                          print(
                                              'Remove myFavorite: $myFavorite');
                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ))
                                    : GestureDetector(
                                        onTap: () {
                                          context
                                              .read<UserProvider>()
                                              .addToFavorite(menu[index]);
                                          print(
                                              'Add TO myFavorite: $myFavorite');
                                        },
                                        child: const Icon(Icons.favorite))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
