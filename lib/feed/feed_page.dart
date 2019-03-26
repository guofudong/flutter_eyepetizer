import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/feed/feed_attention.dart';
import 'package:flutter_eyepetizer/feed/feed_recommend.dart';
import 'package:flutter_eyepetizer/search/search_page.dart';

/// 社区页面
class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //tab数量
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Stack(
            children: <Widget>[
              Align(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: TabBar(
                      //设置tab选中和未选中的属性
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 2,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontSize: 14.2, fontWeight: FontWeight.bold),
                      unselectedLabelColor: Colors.black54,
                      unselectedLabelStyle: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                      indicatorColor: Colors.black,
                      indicatorPadding: new EdgeInsets.only(bottom: -8.0),
                      //tab点击事件
                      onTap: (index) => {},
                      tabs: [Text("发现"), Text("关注")]),
                ),
                alignment: FractionalOffset.center,
              ),
              Align(
                child: IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return SearchPage();
                          }))
                        }),
                alignment: FractionalOffset.centerRight,
              )
            ],
          ),
        ),
        body: TabBarView(children: [FeedRecommendPage(), FeedAttentionPage()]),
      ),
    );
  }
}
