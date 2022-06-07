import 'package:flutter/material.dart';
import 'package:s1_lab/add_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내역 조회 페이지~'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('생성하기 버튼 (이동)'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
        ),
      ),
    );
  }
}
