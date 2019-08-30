import 'package:flutter/material.dart';
import 'MainPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(), //启动MainPage
      ),
    );
//    return ;
  }
}
