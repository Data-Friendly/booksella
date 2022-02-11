import 'package:booksella/screens/sign_in_screen.dart';
import 'package:booksella/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool _showSignIn = true;
  void changeAuthScreens() {
    setState(() {
      _showSignIn = !_showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSignIn) {
      return SignInScreen(changeAuthScreens);
    } else {
      return const SignUpScreen();
    }
  }
}
