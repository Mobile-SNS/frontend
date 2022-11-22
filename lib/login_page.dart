import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'tab_page.dart';

void main() {
  runApp(const LogInPage());
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  // This widget is the root of your application.
  static const routeName = '/login';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();



  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'eg)hansung@xx.com',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          _email = value as String;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: 'Password',
                          hintText: 'eg) very hard key',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,// 보안
                        onSaved: (value) {
                          setState(() {
                            _password = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.toString().length < 8) {
                            return '8자 이상 입력';
                          }
                          if (!RegExp('[0-9]').hasMatch(value)) {
                            return '정규식';
                          }
                          return null;
                        }
                      // inputFormatters: [FilteringTextInputFormatter(RegExp('[0-9]'), allow:false), ],
                      // focusNode: _passwordFocusNode,
                      // keyboardType: TextInputType.text ,
                      // obscureText: true,
                      // decoration: InputDecoration(
                      //   labelText: "비밀번호",
                      //   suffixIcon: Icon(Icons.lock),
                      // ),
                      // textInputAction: TextInputAction.done,
                    ),

                    // SizedBox( height: 16, ),

                    ElevatedButton(
                      child: const Text('로그인'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // validation 이 성공하면 폼 저장하기
                          _formKey.currentState!.save();
                          Navigator.pushNamed(context, '/tab');

                          // If the form is valid, display a SnackBar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_email + '/' + _password)),
                          );
                        }
                        Navigator.pushNamed(context, '/tab');
                      },
                    ),
                    const Text('계정이 없으신가요 ?'),
                    ElevatedButton(
                      child: const Text('Sign up'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
