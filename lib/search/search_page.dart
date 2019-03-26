import 'package:flutter/material.dart';

/// 搜索页面
class SearchPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("搜索"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("搜索"),
      ),
    );
  }

}