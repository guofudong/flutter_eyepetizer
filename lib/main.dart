import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      //不显示标题栏上的Debug字样
      debugShowCheckedModeBanner: false,
      //主页面
      home: App(),
    );
  }
}
