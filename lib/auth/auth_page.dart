import 'package:flutter/material.dart';
import 'package:mobile_sns/auth/login_page.dart';
import 'package:mobile_sns/auth/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //login page
  bool showLogInPage  = true;

  void toggleScreens(){
    setState((){
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLogInPage)
      return LogInPage(showRegisterPage:toggleScreens );
    else
      return RegisterPage(showLogInPage:toggleScreens );
  }
}
