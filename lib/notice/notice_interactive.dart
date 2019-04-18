import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/personal/personal_login.dart';

/// 通知-互动
class NoticeInteractivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 100, bottom: 20),
            child: Image.asset("images/no_account_tip.png"),
          ),
          Text("被错误重要的信息",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.only(top: 8, bottom: 60),
            child: Text("登入后即可查看评论回复、点赞及关注等通知信息",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
          RaisedButton(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 100, right: 100),
            color: Colors.blue,
            elevation: 0,
            onPressed: () => {_toLoginPage(context)},
            child: Text("登入",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18)),
          ),
        ],
      ),
    );
  }

  ///跳转到登入页面
  void _toLoginPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PersonalLogin();
    }));
  }
}
