import 'package:flutter/material.dart';
import 'auth/login_page.dart';

void main() {
  runApp(const SignupPage());
}

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);
  static const routeName = '/signup';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(title: 'NASENKONGSTAGRAM'),
      color: Colors.white,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpState();
}


class _SignUpState extends State<SignUpPage> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children:<Widget> [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) {
                        setState(() {
                          _name = value as String;
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children:<Widget> [
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
                  children: <Widget>[
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
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          children: <Widget>[
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: "비밀번호를 한번 더 입력해주세요",
                          hintText: 'password',
                          border: OutlineInputBorder()
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        setState(() {
                          _password = value as String;
                        });
                      },// 비밀번호를 적을때 안보이도록
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please enter some text';
                        }
                        if (value != _password ) {
                          return "비밀번호가 일치하지 않습니다.";
                        }
                        return null;
                      },
                    ),
                            ElevatedButton(
                              child: const Text('가입'),
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                  ],
                )),
          ],
        ),),
      ],
        )),
    );
  }
}