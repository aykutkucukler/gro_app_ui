import 'package:app_dialog/app_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gro_app_ui/screens/forgot_password.dart';
import 'package:gro_app_ui/screens/main_bottom_home.dart';
import 'package:gro_app_ui/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../validators.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecure = true;
  final formGlobalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formGlobalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Image.asset("assets/images/loging.png"),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Loging",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Enter your email and password",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPassword(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: 360,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formGlobalKey.currentState!.validate()) {
                        signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                      }
                    },
                    child: const Text('Log In'),
                  ),
                ),
                Container(
                  alignment: FractionalOffset.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text('Don\'t have an account?',
                            style: TextStyle(color: Color(0xFF2E3233))),
                      ),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xFF84A2AF),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
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


  Future signInWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool("is_user_active", true);
      EasyLoading.dismiss();

       Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainBottomHomePage()));

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      String desc = "";
      if (e.code == "user-not-found") {
        desc = "User not found please create new account";
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

      if (e.code == "user-not-found") {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      EasyLoading.dismiss();

      print(e);
    }
  }

}
