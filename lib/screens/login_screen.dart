import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/forgot_password.dart';
import 'package:gro_app_ui/screens/register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80,),
                Center(child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset("assets/images/loging.png"),
                )),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Loging",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Enter your email and password",
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "E-mail",
                  ),
                ),
      TextField(
      obscureText: obsecure,
      decoration: InputDecoration(
        suffixIcon: IconButton(icon:Icon(Icons.remove_red_eye),
          onPressed: () {setState((){
            obsecure =! obsecure;
          }); },
        ),
      border: UnderlineInputBorder(),
      labelText: "Password",
      )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: Text('Forgot Password?', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ForgotPassword()
                                )
                            );

                          },
                        )
                    ),
                  ],
                ),
                SizedBox( height: 50, width: 360,
                  child: ElevatedButton(
                      onPressed: () {

                  }, child: Text('Log In'),
                        ),
                ),
                Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {  },
                        child: Text('Don\'t have an account?', style: TextStyle(color: Color(0xFF2E3233))),
                      ),
                      TextButton(
                        child: Text('Sign Up', style: TextStyle(color: Color(0xFF84A2AF), fontWeight: FontWeight.bold),),
                       onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterScreen()
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
      ),
    );
  }
}
