import 'package:flutter/material.dart';

import 'signup_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'signup demo',
      theme: new ThemeData(
        primaryColor: Colors.black,

      ),
      home: new SignupPage(),
    );
  }
}