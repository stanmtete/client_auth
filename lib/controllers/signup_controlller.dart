import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController {
  static Future<void> singupWithEmailAndPassword(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(emailController.text)
          .set({
        'email': emailController.text,
        'password': passwordController.text
      }).then((value) {
        //ignore: avoid_print
        print('User added');
      }).catchError((error) {
        //ignore: avoid_print
        print('Failed to add user: $error');
      });

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        //ignore: avoid_print
        print('The password provided is too weak');
      } else if (ex.code == 'email-already-in-use') {
        //ignore: avoid_print
        print('The account alreadu exists for this email');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('The account already exists for this email'),
            action: SnackBarAction(
              label: 'Exit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } catch (e) {
      //ignore: avoid_print
      print(e);
    }
  }
}
