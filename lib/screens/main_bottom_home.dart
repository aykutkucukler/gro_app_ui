import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/home_screen.dart';
import 'package:gro_app_ui/screens/home_screen_cart.dart';

class MainBottomHomePage extends StatefulWidget {
  const MainBottomHomePage({Key? key}) : super(key: key);

  @override
  State<MainBottomHomePage> createState() => _MainBottomHomePageState();
}

class _MainBottomHomePageState extends State<MainBottomHomePage> {
  List<Widget> pages = [const HomeScreen(), const CartScreen(),];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),

        ],
        onTap: (value) {
          setState(() {
            i = value;
          });
        },
        currentIndex: i,
      ),
      body: pages[i],
    );
  }
}
