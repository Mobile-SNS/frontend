import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mobile_sns/main_page.dart';
import 'package:mobile_sns/pages/feed_page.dart';
import 'package:mobile_sns/pages/posting_page.dart';
import 'pages/tab_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = 'NASENKONGSTAGRAM';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: _title,
      // theme: ThemeData(
      //   primaryColor: Colors.black,
      // ),

      debugShowCheckedModeBanner: false,
      home:MainPage(),

      routes: {
        '/tab': (context) => const TabPage(),
        '/feed': (context) => const FeedPage(),
        '/posting': (context) => const PostingPage(),
      },
    );
  }
}