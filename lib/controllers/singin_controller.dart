import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/home_page.dart';

class SigninController {
  static Future<void> loginWithEmailAndPassword(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No user found for this email'),
            action: SnackBarAction(
              label: 'exit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );

        //ignore: avoid_print
        print('No user found for this email');
      } else if (ex.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Wrong password provided'),
            action: SnackBarAction(
                label: 'Exit',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }),
          ),
        );
        //ignore: avoid_print
        print('Wrong password provided');
      }
    }
  }
}
