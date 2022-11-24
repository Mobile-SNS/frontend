import 'package:flutter/material.dart';
import '../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class LogInPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LogInPage({Key? key,required this.showRegisterPage}) : super(key: key);
  //static const routeName = '/login';

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // firebase_auth 사용한 로그인 구현
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
        child:SingleChildScrollView(
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
                'Welcome to 나센콩스타그램',
                style: TextStyle(
                  fontSize:18,
                ),
              ),
              SizedBox(height:50),

              // 이메일 입력란
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
                    hintText: '이메일',
                    fillColor:Colors.grey[200],
                    filled: true,
                  ),
                ),
            ),
            SizedBox(height:10),

           //비밀번호 입력란
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0),
              child: TextField(
                obscureText: true,
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
                  hintText: '비밀번호',
                  fillColor:Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
              SizedBox(height:10),


              // 로그인 버튼
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

              // 로그인 버튼 밑에 회원가입 창으로 넘어가는 텍스트
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                '회원이 아니신가요?  ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap:widget.showRegisterPage,
                child:Text(
                  '회원가입',
                  style: TextStyle(
                    color:Colors.blue,
                    fontWeight:FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          ],
          ),
        ),
      ),
      ),
    );
  }
}