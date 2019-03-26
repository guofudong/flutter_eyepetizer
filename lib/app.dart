import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/feed/feed_page.dart';
import 'package:flutter_eyepetizer/home/home_page.dart';
import 'package:flutter_eyepetizer/notice/notice_page.dart';
import 'package:flutter_eyepetizer/personal/personal_page.dart';
import 'package:flutter_eyepetizer/publish/publish_page.dart';

/// 应用程序主页面
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  /// tab选中的文本颜色
  Color _colorTabSelect = Colors.black;

  /// tab未选中的文本颜色
  Color _colorTabNormal = Colors.black38;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //底部导航tab
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          //设置tab选中和未选中的属性
          selectedItemColor: _colorTabSelect,
          unselectedItemColor: _colorTabNormal,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          //tab点击事件
          onTap: (index) => {
                setState(() {
                  _currentIndex = index;
                })
              },
          items: [
            BottomNavigationBarItem(
                title: Text("首页"),
                icon: _currentIndex == 0
                    ? Image.asset("images/ic_tab_strip_icon_feed_selected.png")
                    : Image.asset("images/ic_tab_strip_icon_feed.png")),
            BottomNavigationBarItem(
                title: Text("社区"),
                icon: _currentIndex == 1
                    ? Image.asset(
                        "images/ic_tab_strip_icon_follow_selected.png")
                    : Image.asset("images/ic_tab_strip_icon_follow.png")),
            BottomNavigationBarItem(
                title: Text(
                  "",
                  style: TextStyle(fontSize: 0),
                ),
                icon: Image.asset("images/ic_home_public.png")),
            BottomNavigationBarItem(
                title: Text("通知"),
                icon: _currentIndex == 3
                    ? Image.asset(
                        "images/ic_tab_strip_icon_category_selected.png")
                    : Image.asset("images/ic_tab_strip_icon_category.png")),
            BottomNavigationBarItem(
                title: Text("我的"),
                icon: _currentIndex == 4
                    ? Image.asset(
                        "images/ic_tab_strip_icon_profile_selected.png")
                    : Image.asset("images/ic_tab_strip_icon_profile.png"))
          ]),
      //页面展示的内容
      body: _currentPage(),
    );
  }

  /// 根据选中的tab显示对应的内容
  Widget _currentPage() {
    Widget page;
    switch (_currentIndex) {
      case 0:
        page = HomePage();
        break;
      case 1:
        page = FeedPage();
        break;
      case 2:
        page = PublishPage();
        break;
      case 3:
        page = NoticePage();
        break;
      case 4:
        page = PersonalPage();
        break;
    }
    return page;
  }
}
