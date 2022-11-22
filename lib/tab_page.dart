import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'posting_page.dart';
import 'login_page.dart';

void main() {
  runApp(const TabPage());
}


class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);
  static const routeName = '/tap';
  // This widget is the root of your application.

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage>{
  int _selectedPageIndex = 0; // 선택된 페이지의 인덱스 넘버 초기화

 final List<Widget> _widgetOptions = <Widget> [
   FeedPage(),
   PostingPage(),

 ];// n개의 페이지를 연결할 예정이므로 n개의 페이지를 여기서 지정해준다. 탭 레이아웃은 n개.

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('NASENKONGSTAGRAM'),
        elevation: 0.0,
        actions: [
          IconButton(icon: Icon(Icons.add_box_outlined, color: Colors.black,),
            onPressed:() {
              Navigator.pushNamed(context, '/posting');
            },),
        ],
        actionsIconTheme: IconThemeData(color: Colors.black38, size: 50.0),
      ),
      //body에 넣어줄 아이템
      body: Center(
        child: _widgetOptions.elementAt(_selectedPageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(


           items: const <BottomNavigationBarItem>[
             BottomNavigationBarItem(
               icon: Icon(Icons.text_snippet),
               label: 'Feed',
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.account_circle),
               label: 'profile',
             ),
             BottomNavigationBarItem(
               icon: Icon(Icons.text_snippet),
               label: 'feed',
             ),
           ],
        onTap: _onItemTapped, // 선언했던 onItemTapped
        currentIndex: _selectedPageIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,

           ),

      );

    }
  void _onItemTapped(int index){// 탭을 클릭했을떄 지정한 페이지로 이동
    setState((){
      _selectedPageIndex = index;
    });
    @override
    void initState() {
      //해당 클래스가 호출되었을떄
      super.initState();

    }
    @override
    void dispose() {
      super.dispose();
    }
  }
}
