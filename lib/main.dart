import 'package:flutter/material.dart';

import 'signup_page.dart';
import 'login_page.dart';
import 'tab_page.dart';
import 'feed_page.dart';
import 'posting_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'NASENKONGSTAGRAM';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home:const LogInPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LogInPage(),
        '/signup': (context) => const SignUpPage(title: 'signup'),
        '/tab': (context) => const TabPage(),
        '/feed': (context) => const FeedPage(),
        '/posting': (context) => const PostingPage(),
      },
    );


  }
}