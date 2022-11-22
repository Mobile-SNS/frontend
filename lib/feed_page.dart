import 'package:flutter/material.dart';


void main() {
  runApp(const FeedPage());
}
class FeedPage extends StatefulWidget {
const FeedPage({Key? key}) : super(key: key);
// This widget is the root of your application.
static const routeName = '/feed';

@override
State<FeedPage> createState() => _FeedPageState();
}


class _FeedPageState extends State<FeedPage> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text('Feed Page')
    );

  }

}
