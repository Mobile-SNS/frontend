import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_sns/pages/tab_page.dart';
import 'auth/auth_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:StreamBuilder<User?>(stream:FirebaseAuth.instance.authStateChanges(),
        builder:(contect,snapshot) {
          if (snapshot.hasData) {
            return TabPage();
          } else {
            return AuthPage();
          }
        },
        ),
    );
  }
}
