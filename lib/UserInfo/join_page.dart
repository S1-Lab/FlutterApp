import 'package:flutter/material.dart';
import 'package:s1_lab/tab_page.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입 페이지~"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('asset/images/s1_logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            FlatButton(
              onPressed: (){

              },
              child: Text(
                '인증번호 받기',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '인증번호',
                    hintText: '인증번호 6자리'),
              ),
            ),
            FlatButton(
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {

                    Future.delayed(Duration(seconds: 3), () {
                      Navigator.pop(context);
                    });

                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      content: SizedBox(
                        height: 200,
                        child: Center(
                            child:SizedBox(
                              child:
                              new CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation(Colors.blue),
                                  strokeWidth: 5.0
                              ),
                              height: 50.0,
                              width: 50.0,
                            )
                        ),
                      ),
                    );
                  },
                );

              },
              child: Text(
                '인증번호 확인',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호',
                    hintText: '비밀번호'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호 확인',
                    hintText: '비밀번호 확인'),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TabPage()));
              },
              child: Text(
                '회원가입 완료',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
