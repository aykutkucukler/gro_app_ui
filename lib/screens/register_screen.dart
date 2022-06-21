import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/screens/home_screen.dart';
import 'package:gro_app_ui/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecure = true;
  final formGlobalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    EasyLoading.init();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset('assets/images/loging.png'),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Sign up',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Enter your credentials to continue',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ],
                ),
                nameTextField(),
                emailTextField(),
                passwordTextField(),
                Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text('By continuing agree to our',
                            style: TextStyle(color: Color(0xFF2E3233))),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Term of services and services',
                            style: TextStyle(
                                color: Color(0xFF84A2AF),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        createUserWithEmailAndPassword(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
                Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text('Already have an account?',
                            style: TextStyle(color: Color(0xFF2E3233))),
                      ),
                      TextButton(
                        child: const Text(
                          'Log In',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regex.hasMatch(email);
  }

  TextFormField passwordTextField() {
    return TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value == null || value.length < 6) {
            return "Check Password";
          }
          return null;
        },
        obscureText: obsecure,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              setState(() {
                obsecure = !obsecure;
              });
            },
          ),
          border: const UnderlineInputBorder(),
          labelText: "Password",
        ));
  }

  TextFormField emailTextField() {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (value == null || value.length == 0) {
          return "E-mail can not be null";
        }
        if (!isEmailValid(value)) {
          return "Check E-mail";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "E-mail",
      ),
    );
  }

  TextFormField nameTextField() {
    return TextFormField(
      controller: userNameController,
      validator: (value){
        if (value == null || value.length < 6) {
          return "Check Password";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: "Username.",
      ),
    );
  }

  Future createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.dismiss();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
