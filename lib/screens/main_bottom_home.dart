import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/home_screen.dart';
import 'package:gro_app_ui/screens/login_screen.dart';
import 'package:gro_app_ui/screens/register_screen.dart';

class MainBottomHomePage extends StatefulWidget {
  const MainBottomHomePage({Key? key}) : super(key: key);

  @override
  State<MainBottomHomePage> createState() => _MainBottomHomePageState();
}

class _MainBottomHomePageState extends State<MainBottomHomePage> {
  List<Widget> pages = [HomeScreen(), const RegisterScreen(),];
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
            icon: Icon(Icons.ad_units),
            label: "AVC",
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
