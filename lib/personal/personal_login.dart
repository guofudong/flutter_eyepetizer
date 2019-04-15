import 'package:flutter/material.dart';
///登入页面
class PersonalLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PersonalLoginState();
}

class _PersonalLoginState extends State<PersonalLogin> {
  ///登入按钮使能背景颜色
  static const Color COLOR_ENABLE = Color.fromARGB(255, 255, 255, 255);
  ///登入按钮禁止背景颜色
  static const Color COLOR_DISENABLE = Color.fromARGB(120, 255, 255, 255);
  ///用户密输入的密码
  String _userPassword;
  ///用户输入的用户名
  String _userName;
  ///登入按钮当前的颜色
  Color _colorBtnLogin = COLOR_DISENABLE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //防止键盘弹出 导致超出屏幕
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          //页面背景图片
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/ic_bg_login.png"),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //顶部关闭按钮和找回密码
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      //将主轴方向上的空白区域均分，使得children之间的空白区域相等，首尾child都靠近首尾，没有间隙；
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //关闭页面
                            Navigator.of(context).pop();
                          },
                          child:
                              Icon(Icons.close, color: Colors.white, size: 24),
                        ),
                        GestureDetector(
                          onTap: () {
                            //找回密码
                            _retrievePassword(context);
                          },
                          child: Text(
                            "找回密码",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  //logo图片
                  Padding(padding: EdgeInsets.only(top: 20,bottom: 16),
                  child: Image.asset(
                    "images/ic_account_login_header.png",
                    height: 60,
                    fit: BoxFit.cover,
                  ),),
                  Text("登入后即可关注作者",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text("发表评论、同步喜欢视频和播放记录",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
              //用户名和密码输入框
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //用户名
                    Container(
                      margin: EdgeInsets.only(right: 40, left: 40),
                      decoration: ShapeDecoration(
                          shape: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(230, 255, 255, 255),
                                  width: 0.3))),
                      child: TextField(
                        autofocus: false,
                        cursorWidth: 1,
                        cursorColor: Colors.green,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        onChanged: (str) {
                          _userPassword = str;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 16,
                            ),
                            //隐藏最大长度提示，这是显示一个空格，不然跟下边框会重合
                            counterText: " ",
                            contentPadding: EdgeInsets.all(-15),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                            hintText: "请输入手机号/邮箱地址"),
                      ),
                    ),
                    //密码
                    Container(
                      margin: EdgeInsets.only(right: 40, left: 40, top: 30),
                      decoration: ShapeDecoration(
                          shape: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(230, 255, 255, 255),
                                  width: 0.3))),
                      child: TextField(
                        autofocus: false,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        cursorWidth: 1,
                        cursorColor: Colors.green,
                        maxLines: 1,
                        maxLength: 30,
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                        onChanged: (str) {
                          _userName = str;
                          setState(() {
                            _changeBtnLoginState();
                          });
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 16,
                            ),
                            //隐藏最大长度提示
                            counterText: " ",
                            contentPadding: EdgeInsets.all(-15),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                            hintText: "请输入密码"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: RaisedButton(
                          padding: EdgeInsets.only(
                              left: 115, right: 115, top: 8, bottom: 8),
                          onPressed: () => {
                                _userName.isEmpty || _userPassword.isEmpty
                                    ? null
                                    : {_loginBtnClick()}
                              },
                          color: _colorBtnLogin,
                          child: Text(
                            "登入",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            child: Text(
                              "用户注册",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "作者登入",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //底部三方登入相关
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                                icon: Image.asset(
                                    "images/ic_account_login_weibo.png"),
                                iconSize: 48,
                                onPressed: null),
                            IconButton(
                                icon: Image.asset(
                                    "images/ic_account_login_wechat.png"),
                                iconSize: 48,
                                onPressed: null),
                            IconButton(
                                icon: Image.asset(
                                    "images/ic_account_login_qq.png"),
                                iconSize: 48,
                                onPressed: null),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                      ),
                      Divider(
                          height: 1, color: Color.fromARGB(100, 255, 255, 255)),
                      Padding(
                          padding: EdgeInsets.only(top: 18, bottom: 18),
                          child: Text.rich(
                            TextSpan(
                                text: '登入或注册即同意开眼',
                                style: new TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[500],
                                ),
                                children: [
                                  TextSpan(
                                    text: " 用户服务协议",
                                    style: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  ///更改登入按钮状态
  void _changeBtnLoginState() {
      if(_userName.isNotEmpty && _userPassword.isNotEmpty){
      _colorBtnLogin = COLOR_ENABLE;
    }else{
      _colorBtnLogin = COLOR_DISENABLE;
    }
  }

  ///登入
 void _loginBtnClick() {}
}

///找回密码
void _retrievePassword(BuildContext context) {}
