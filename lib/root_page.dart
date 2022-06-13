import 'package:flutter/material.dart';
import 'package:s1_lab/UserInfo/login_page.dart';
import 'package:s1_lab/tab_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _tempboolean = true ;
    if(_tempboolean){
      return TabPage();
    }
    else{
      return LoginPage();
    }
  }
}
