import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/screens/home_screen.dart';
import 'package:gro_app_ui/screens/main_bottom_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> isActive;
  late bool isUserActive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: EasyLoading.init(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: FutureBuilder<bool>(
            future: getBool(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.data==true) {
                return MainBottomHomePage();
              } else {
                return LoginPage();
              }
            }));
  }

  Future<bool> getBool() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool value = pref.getBool("is_user_active") ?? false;
    return value;
  }
}
