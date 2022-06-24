import 'package:app_dialog/app_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/screens/home_screen.dart';
import 'package:gro_app_ui/screens/login_screen.dart';

import '../validators.dart';
import '../widgets/custom_text_field.dart';

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
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.asset('assets/images/loging.png'),
                  ),
                ),
                const SizedBox(height: 70),
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Enter your credentials to continue',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                  ],
                ),

                //nameTextField(),
                //emailTextField(),
                CustomTextField(
                  controller: userNameController,
                  labelText: "Username",
                  validator: Validators.validateUserName,
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: "E-mail",
                  validator: Validators.validateEmail,
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  obscureText: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        obsecure = !obsecure;
                      });
                    },
                  ),
                  validator: Validators.validatePassword,
                  border: null,
                ),

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
          context, MaterialPageRoute(builder: (context) => HomeScreen()));

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      String desc = "";

      if (e.code == "email-already-in-use") {
        desc = "E-mail already in use";
      }

      if (e.code == "email-already-in-use") {
        desc = "Email has account";
      }

      AppDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHT_SLIDE,
          headerAnimationLoop: false,
          title: 'Error',
          desc: desc,
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        .show();

      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
    }
  }
}
