import 'package:flutter/material.dart';

/// 首页-发现-item点击详情页面
class HomeFindDetail extends StatefulWidget {
  final String name;

  HomeFindDetail({this.name});

  @override
  State<StatefulWidget> createState() => _HomeFindDetailState();
}

class _HomeFindDetailState extends State<HomeFindDetail> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            primaryColor: Colors.white, backgroundColor: Colors.white),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            alignment: Alignment.center,
            child: Text(widget.name + ""),
          ),
        ));
  }
}
