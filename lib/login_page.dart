import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const LogInPage());
}

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  //static const routeName = '/login';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim()
    );
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.android,
              size:100,
            ),
            SizedBox(height:75),
            Text(
              'NASENKONGStagram',
              style:GoogleFonts.bebasNeue(
                fontSize:52,
              ),
            ),
            SizedBox(height:10),
            Text(
              '로그인 하세요?',
              style: TextStyle(
                fontSize:18,
              ),
            ),
            SizedBox(height:50),

            // email textfield
            Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: TextField(
                  controller: _emailController,
                  decoration:InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                      borderRadius:BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:BorderSide(color:Colors.deepPurple),
                      borderRadius:BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor:Colors.grey[200],
                    filled: true,
                  ),
                ),
            ),
            SizedBox(height:10),

           //password textfield
            Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
    child: TextField(
            controller: _passwordController,
            decoration:InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Colors.white),
                borderRadius:BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:BorderSide(color:Colors.deepPurple),
                borderRadius:BorderRadius.circular(12),
              ),
              hintText: 'Password',
              fillColor:Colors.grey[200],
              filled: true,
            ),
          ),
        ),
        SizedBox(height:10),

        Padding(
    padding: const EdgeInsets.symmetric(horizontal:25.0),
                        child:GestureDetector(
                          onTap:signIn,
                          child: Container(
                            padding:EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color:Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:Center(
                              child:Text(
                                '로그인',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize:18,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),

                    SizedBox(height:25),
        ],

        ),
    ),
    ),
    );
  }
}