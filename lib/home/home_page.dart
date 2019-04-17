import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/home/home_daily.dart';
import 'package:flutter_eyepetizer/home/home_find.dart';
import 'package:flutter_eyepetizer/home/home_recommend.dart';
import 'package:flutter_eyepetizer/search/search_page.dart';

///首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //tab数量
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              //顶部Tab
              title: Stack(
                children: <Widget>[
                  Align(
                    alignment: FractionalOffset.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 * 1.2,
                      alignment: Alignment.center,
                      child: TabBar(
                          //设置tab选中和未选中的属性
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 2,
                          labelColor: Colors.black,
                          indicatorPadding: EdgeInsets.only(bottom: 8),
                          labelStyle: TextStyle(
                              fontSize: 14.2, fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.black54,
                          unselectedLabelStyle: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                          indicatorColor: Colors.black,
                          //tab点击事件
                          onTap: (index) => {},
                          tabs: [
                            Tab(child: Text("发现")),
                            Tab(child: Text("推荐")),
                            Tab(child: Text("日报"))
                          ]),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.centerRight,
                    child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.search,color: Colors.black),
                        //按下事件
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return SearchPage();
                              }))
                            }),
                  )
                ],
              ),
              //设置TabBar底部的分割线
              bottom: PreferredSize(
                child: Container(
                  color: Color.fromARGB(12, 6, 6, 6),
                  constraints: BoxConstraints.expand(height: 1),
                ),
              ),
            ),
            //tab对应的内容
            body: TabBarView(
              children: <Widget>[
                HomeFindPage(),
                HomeRecommendPage(),
                HomeDailyPage(),
              ],
            )));
  }
}
