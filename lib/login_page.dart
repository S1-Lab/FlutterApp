import 'package:flutter/material.dart';
import 'package:s1_lab/history_page.dart';
import 'package:s1_lab/join_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인 페이지~~'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('회원가입페이지'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinPage()),
            );
          },
        ),
      ),
    );
  }
}
