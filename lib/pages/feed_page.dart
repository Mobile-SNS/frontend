import 'package:flutter/material.dart';


void main() {
  runApp(const FeedPage());
}

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static const routeName = '/feed';

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text('Feed Page')
    );
  }
}