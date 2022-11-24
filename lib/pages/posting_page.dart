import 'package:flutter/material.dart';

void main() {
  runApp(const PostingPage());
}

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key}) : super(key: key);
  static const routeName = '/posting';

  @override
  State<PostingPage> createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  final myController = TextEditingController();

  // _MyCustomFormState가 제거될 때 호출
  @override
  void dispose(){
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    myController.dispose();
    super.dispose();
  }

  Widget _imagePreview() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),

            )
        ),

        title: const Text(
          'New Post',
          style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 20),
        ),

      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: null,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
  @override
  Widget _buildBody() {
    return Column(
      children: <Widget>[
        _imagePreview(),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: myController,
        )
      ],
    );
  }
}
