import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/screens/login_screen.dart';
import 'package:gro_app_ui/widgets/search_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> images = [
      Image.asset("assets/images/loging.png"),
      Image.asset("assets/images/banner_background.png"),
      Image.asset("assets/images/loging.png"),
      Image.asset("assets/images/banner_background.png"),
      Image.asset("assets/images/loging.png"),
    ];
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () {
          logout(context);
        },
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset("assets/images/loging.png"),
                const SizedBox(
                  height: 20,
                ),
                SearchBarWidget(),
                const SizedBox(
                  height: 25,
                ),
                CarouselSlider(
                    options: CarouselOptions(height: 135.0), items: images),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('Exclusive Order',
                          style: TextStyle(
                              color: Color(0xFF2E3233),
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      child: const Text(
                        'See all',
                        style: TextStyle(
                            color: Color(0xFF84A2AF),
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 200, height: 100, color: Colors.red),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 100,
                            color: Colors.red,
                            child: Stack(children: const [
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ))
                            ]),
                          ),
                        )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  logout(BuildContext context) async {
    EasyLoading.show();
    FirebaseAuth.instance.signOut();
    var pref = await SharedPreferences.getInstance();
    await pref.remove("is_user_active");
    EasyLoading.dismiss();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false);
  }
}
