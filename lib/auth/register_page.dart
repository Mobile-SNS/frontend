import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLogInPage;
  const RegisterPage({Key? key, required this.showLogInPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  Future signUp() async{
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
    }
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim()== _confirmpasswordController.text.trim()){
      return true;
    }
    else{
      return false;
    }
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
                  '회원가입',
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
                      hintText: 'Email',
                      fillColor:Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height:10),

                // 비밀번호 입력란
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
                      hintText: 'Password',
                      fillColor:Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height:10),

                // 비밀번호 확인
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmpasswordController,
                    decoration:InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.white),
                        borderRadius:BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:BorderSide(color:Colors.deepPurple),
                        borderRadius:BorderRadius.circular(12),
                      ),
                      hintText: 'Confrim Password',
                      fillColor:Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height:10),

                // 회원가입 버튼
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child:GestureDetector(
                    onTap:signUp,
                    child: Container(
                      padding:EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color:Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:Center(
                        child:Text(
                          '회원가입',
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

                // 회원가입 버튼 밑 로그인 창으로 넘어가는 텍스트
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      '회원이신가요?  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap:widget.showLogInPage,
                      child:Text(
                        '로그인 하기',
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
