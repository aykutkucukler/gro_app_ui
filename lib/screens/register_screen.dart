import 'package:flutter/material.dart';
import 'package:gro_app_ui/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Image.asset('assets/images/loging.png'),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Sign up',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text('Enter your credentials to continue',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Username.",
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "E-mail",
                ),
              ),
              TextField(
                  obscureText: obsecure,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon:const Icon(Icons.remove_red_eye),
                      onPressed: () {setState((){
                        obsecure =! obsecure;
                      }); },
                    ),
                    border: const UnderlineInputBorder(),
                    labelText: "Password",
                  )),
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: const Text('By continuing agree to our', style: TextStyle(color: Color(0xFF2E3233))),
                    ),
                    TextButton(
                      onPressed: () {  },
                      child: const Text('Term of services and services', style: TextStyle(color: Color(0xFF84A2AF), fontWeight: FontWeight.bold),),




                    )
                  ],
                ),
              ),

              SizedBox( height: 50, width: 360,
                child: ElevatedButton(
                  onPressed: () {

                  }, child: const Text('Sign In'),


                ),
              ),

              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {  },
                      child: const Text('Already have an account?', style: TextStyle(color: Color(0xFF2E3233))),
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
