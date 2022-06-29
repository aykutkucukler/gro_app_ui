import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profilepic.png"),
                  maxRadius: 50,
                  minRadius: 50,
                ),
                Text(
                  ' Ayşe Fatma\n',
                  textAlign: TextAlign.left,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'aysefatma@gmail.com',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 13),
                ),
              ],
            ),
          ),
          Row(children: const <Widget>[
            Icon(Icons.shopping_bag_outlined),
            Text("Orders")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.account_circle_outlined),
            Text("My Details")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.location_on_outlined),
            Text("Delivery Address")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.credit_card),
            Text("Payment Methods")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.card_giftcard_outlined),
            Text("Promo Card")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.add_alert_sharp),
            Text("Notifaction")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.help_outline_outlined),
            Text("Help")
          ]),
          Row(children: const <Widget>[
            Icon(Icons.align_vertical_bottom_outlined),
            Text("About")
          ]),
        ],
      ),
    );
  }
}
