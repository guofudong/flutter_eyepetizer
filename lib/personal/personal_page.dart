import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/personal/personal_login.dart';

/// 我的页面
class PersonalPage extends StatelessWidget {
  List<String> _datas = [
    "我的关注",
    "观看记录",
    "通知开关",
    "我的徽章",
    "意见反馈",
    "我要投稿",
    "Version 5.2.472"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: <Widget>[
        //顶部右侧按钮
        Align(
            alignment: FractionalOffset.centerRight,
            child: IconButton(
                iconSize: 48,
                icon: Image.asset("images/ic_menu_more.png"),
                onPressed: () => {
                      //顶部更多
                    })),
        GestureDetector(
          onTap: () {
            _toLogin(context);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Color.fromARGB(32, 0, 0, 0), width: 1.0),
              shape: BoxShape.circle,
            ),
            child: Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80.0,
                child: Image.asset("images/ic_default_avatar.png"),
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Color.fromARGB(12, 0, 0, 0),
                  shape: BoxShape.circle,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text("点击登入即可发表评论及同步已喜欢视频",
              style:
                  TextStyle(fontSize: 14, color: Color.fromARGB(200, 0, 0, 0))),
        ),
        //喜欢和缓存按钮
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toLogin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/ic_menu_heart.png"),
                      Text(
                        "喜欢",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                flex: 1),
            Container(
              width: 1,
              height: 26,
              color: Color.fromARGB(60, 0, 0, 0),
            ),
            Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toLogin(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("images/ic_menu_download.png"),
                      Text(
                        "缓存",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                flex: 1)
          ],
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          color: Color.fromARGB(32, 0, 0, 0),
          height: 1,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: _itemBuilder,
        ))
      ],
    ));
  }

  ///ListView 的item视图
  Widget _itemBuilder(BuildContext context, int index) {
    TextStyle textStyle;
    double paddingBottom = 0;
    if (index == _datas.length - 1) {
      textStyle = TextStyle(fontSize: 12, color: Color.fromARGB(60, 0, 0, 0));
      paddingBottom = 10;
    } else {
      textStyle = TextStyle(fontSize: 15, color: Color.fromARGB(200, 0, 0, 0));
    }
    return GestureDetector(
      onTap: () {
        _toLogin(context);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 46, bottom: paddingBottom),
        child: Text(_datas[index], style: textStyle),
      ),
    );
  }

  ///跳转登入页面
  void _toLogin(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PersonalLogin();
    }));
  }
}
