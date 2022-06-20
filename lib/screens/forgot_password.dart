import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Center(child: Image.asset("assets/images/forgot.png")),
              const SizedBox(height: 75,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Enter your email and password",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                  ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: ( ) {

              }, child: const Text ("Send E-mail Create New Password")
              ),
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {  },
                      child: const Text('Back to', style: TextStyle(color: Color(0xFF2E3233))),
                    ),
                    TextButton(
                      child: const Text('Log In', style: TextStyle(color: Color(0xFF84A2AF), fontWeight: FontWeight.bold),),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()
                            )
                        );

                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
