import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/model/buy_item_model.dart';
import 'package:gro_app_ui/screens/login_screen.dart';
import 'package:gro_app_ui/widgets/collect_items.dart';
import 'package:gro_app_ui/widgets/item_widget.dart';
import 'package:gro_app_ui/widgets/search_bar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> images = [
      Image.asset("assets/images/loging.png"),
      Image.asset("assets/images/banner_background.png"),
      Image.asset("assets/images/banner_image.png"),
      Image.asset("assets/images/banner_background.png"),
      Image.asset("assets/images/sebzemeyve.jpg"),
    ];

    List<ItemWidget> buyItems = [];

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 85.0),
          child: Text("Groceries"),
        ),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            logout(context);
          },
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: IconButton(
                  icon: const Icon(Icons.settings), onPressed: () {})),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/loging.png",
                  height: 35,
                ),
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
                Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ItemWidget(
                            buyItem: BuyItem(
                                "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                            function: () {
                              setState(() {
                                CollectItem.collectItems.add(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            },
                            isInChart: false,
                            deleteFunction: () {
                              setState(() {
                                CollectItem.collectItems.remove(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            }),
                        ItemWidget(
                            buyItem: BuyItem(
                                "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                            function: () {
                              setState(() {
                                CollectItem.collectItems.add(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            },
                            isInChart: false,
                            deleteFunction: () {
                              setState(() {
                                CollectItem.collectItems.remove(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            }),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('Best Selling',
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
                Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ItemWidget(
                            buyItem: BuyItem(
                                "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                            function: () {
                              setState(() {
                                CollectItem.collectItems.add(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            },
                            isInChart: false,
                            deleteFunction: () {
                              setState(() {
                                CollectItem.collectItems.remove(
                                  BuyItem(
                                      "https://www.gercekhayat.com.tr/wp-content/uploads/2019/10/AdobeStock_172352188-800x450.jpg"),
                                );
                              });
                            }),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('Groceries',
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
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (Route<dynamic> route) => false);
  }
}
