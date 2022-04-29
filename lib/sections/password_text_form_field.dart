import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool isToglled;
  final Function visibilityHandled;

  const PasswordTextFormField(
      {required this.passwordController,
      required this.isToglled,
      required this.visibilityHandled,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: passwordController,
        autofocus: true,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isToglled,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusColor: Colors.green,
          labelText: 'Enter your password',
          prefixIcon: const Icon(Icons.lock_open_outlined),
          suffixIcon: IconButton(
            onPressed: () => visibilityHandled(),
            icon: isToglled
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            hoverColor: Colors.transparent,
          ),
        ),
        validator: (paswd) {
          if (paswd == null || paswd.isEmpty) {
            return 'Password required';
          } else if (paswd.length < 8) {
            return 'Password too short should be atleat 8 character';
          }
          return null;
        },
      ),
    );
  }
}
