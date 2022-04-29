import 'package:auth_app2/controllers/includes.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormField(this.emailController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: emailController,
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        enabled: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusColor: Colors.green,
          labelText: 'Enter your email',
          prefixIcon: const Icon(Icons.email_outlined),
        ),
        validator: (email) {
          if (email == null || email.isEmpty) {
            return 'Email required';
          } else if (!email.isValidEmail()) {
            return 'Invalid email address';
          }
          return null;
        },
      ),
    );
  }
}
