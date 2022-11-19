import 'package:flutter/material.dart';

import 'signup_page.dart';
import 'login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASENKONGSTAGRAM demo',
      theme: ThemeData(
        primaryColor: Colors.black,

      ),
      home:const LogInPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(title: 'signup'),
      },
    );
  }
}