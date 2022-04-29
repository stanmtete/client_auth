import 'package:auth_app2/sections/email_form_field.dart';
// import 'package:auth_app2/sections/image_header.dart';
import 'package:auth_app2/sections/password_text_form_field.dart';
import 'package:auth_app2/sections/submit_button.dart';
import 'package:auth_app2/sections/text_button_section.dart';
import 'package:auth_app2/sections/title_header.dart';
import 'package:flutter/material.dart';
import '../controllers/singin_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //CREATE INSTANCE VARIABLES
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = false;
  final double _sizedBoxHeight = 20;

  // ignore: unused_field
  final String _imageURL =
      'https://cdn.pixabay.com/photo/2020/05/18/16/17/social-media-5187243__480.png';
  final String headerSubtitle =
      'Welcome to client auth UI, sign in to start you\'re session';
  void _visibilityHandled() {
    setState(() {
      _toggleVisibility = !_toggleVisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ImageHeader(_imageURL),
                    TitleHeader(title: 'Sign In', subtitle: headerSubtitle),
                    SizedBox(
                      height: _sizedBoxHeight,
                    ),
                    EmailFormField(emailController),
                    SizedBox(height: _sizedBoxHeight - 4),
                    PasswordTextFormField(
                      passwordController: passwordController,
                      isToglled: _toggleVisibility,
                      visibilityHandled: _visibilityHandled,
                    ),
                    SizedBox(height: _sizedBoxHeight),
                    SubmitButton(
                      handleOnPressed: _handleOnPressed,
                      btnLabel: 'Sign in',
                    ),
                    const TextButtonSection(
                      textLeading: 'Don\'t have an account? ',
                      textTail: 'Register',
                      routeName: '/signup',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _handleOnPressed() {
    if (_formKey.currentState!.validate()) {
      SigninController.loginWithEmailAndPassword(
        context,
        emailController,
        passwordController,
      );
      emailController.clear();
      passwordController.clear();
    }
  }
}
