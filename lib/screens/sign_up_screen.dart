import '../sections/email_form_field.dart';
import '../sections/password_text_form_field.dart';
import '../sections/text_button_section.dart';
import '../sections/title_header.dart';
import '../controllers/signup_controlller.dart';
import 'package:flutter/material.dart';
import '../sections/submit_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //CREATE INSTANCE VARIABLES
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPaswdController = TextEditingController();

  bool toggleVisibility = false;
  final double _sizedBoxHeight = 20;
  final String headerTitle =
      'Welcome to client auth UI!, create your account to continue';
  // ignore: unused_field
  final String _imageURL =
      'https://cdn.pixabay.com/photo/2020/05/18/16/17/social-media-5187243__480.png';

  visibilityHandled() {
    setState(() {
      toggleVisibility = !toggleVisibility;
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // ImageHeader(_imageURL),
                    TitleHeader(title: 'Sign Up', subtitle: headerTitle),
                    SizedBox(height: _sizedBoxHeight - 4),
                    EmailFormField(emailController),
                    SizedBox(height: _sizedBoxHeight),
                    PasswordTextFormField(
                      passwordController: passwordController,
                      isToglled: toggleVisibility,
                      visibilityHandled: visibilityHandled,
                    ),
                    SizedBox(height: _sizedBoxHeight),
                    confirmPasswordTextFormField(context),
                    SizedBox(height: _sizedBoxHeight),
                    SubmitButton(
                      handleOnPressed: _handleOnPressed,
                      btnLabel: 'Sign up',
                    ),
                    const TextButtonSection(
                      textLeading: 'I am already a member?',
                      textTail: 'Login',
                      routeName: '/signin',
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

  //CONFIRM PASSWORD TEXTFORM FIELD
  Widget confirmPasswordTextFormField(BuildContext context) {
    return SizedBox(
      width: 400,
      child: TextFormField(
        controller: confirmPaswdController,
        autofocus: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusColor: Colors.green,
          labelText: 'Confirm your password',
          prefixIcon: const Icon(Icons.lock_outline),
        ),
        validator: (paswd) {
          if (paswd == null || paswd.isEmpty) {
            return 'Field required';
          } else if (paswd != passwordController.text) {
            return 'Password didn\'t match!';
          }
          return null;
        },
      ),
    );
  }

  _handleOnPressed() {
    if (formKey.currentState!.validate()) {
      SignupController.singupWithEmailAndPassword(
              context, emailController, passwordController)
          .whenComplete(() {
        emailController.clear();
        passwordController.clear();
        confirmPaswdController.clear();
      });
    }
  }
}
