import 'package:auth_app2/screens/sign_in_screen.dart';
import 'package:auth_app2/screens/sign_up_screen.dart';
import 'package:auth_app2/screens/welcome.dart';
import 'package:auth_app2/styles/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Client Auth UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: titleLargeTextStyle,
          titleMedium: titleMediumTextStyle,
          bodyMedium: bodyTextStyle,
        ),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const Welcome(),
    '/signin': (context) => const SignInScreen(),
    '/signup': (context) => const SignUpScreen(),
  };
}
