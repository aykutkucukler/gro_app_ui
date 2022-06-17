import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/login_screen.dart';
import 'package:gro_app_ui/screens/register_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  get resizeToAvoidBottomPadding => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/images/123123.png'),

              ),
              Text("WELCOME TO OUR GROCERİES STORE"
              ),

              ElevatedButton(
                child: Text('LOG IN'),
                onPressed: () {
                  Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => const LoginPage()
                     )
                     );

                },
              ),
              ElevatedButton(
                child: Text('SIGN UP'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()
                      )
                  );

                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
