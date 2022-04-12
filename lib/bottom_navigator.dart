import 'package:flutter/material.dart';
import 'package:provider_my_project/provider/navigation_provider.dart';
import 'package:provider_my_project/screens/favorite/favorite_screen.dart';
import 'package:provider_my_project/screens/home/home_screen.dart';
import 'package:provider_my_project/screens/menu/menu.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> listScreen = [HomeScreen(), MenuScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    int screenIndex = context.watch<NavigationProvider>().currentIndex;
    return Scaffold(
      body: listScreen[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.pinkAccent,
        type: BottomNavigationBarType.fixed, // This is all you need!

        currentIndex: screenIndex,
        onTap: (index) =>
            context.read<NavigationProvider>().setCurrentIndex(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cabin,
              ),
              label: "Shop"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite")
        ],
      ),
    );
  }
}
