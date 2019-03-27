import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/common/Api.dart';
import 'package:flutter_eyepetizer/home/home_find_detail_list.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_eyepetizer/model/entity/HomeFindDetailEntity.dart';

/// 首页-发现-item点击详情页面
class HomeFindDetail extends StatefulWidget {
  final String name;

  HomeFindDetail({this.name});

  @override
  State<StatefulWidget> createState() => _HomeFindDetailState();
}

class _HomeFindDetailState extends State<HomeFindDetail>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  HomeFindDetailEntity _headerData;
  ScrollController _scrollViewController;
  TabController _tabController;
  Color _headerNavigateColor = Colors.white;
  final double _flexibleSpaceHeight = 120;
  double _headerTitleSize = 0;
  int _currentState = 0;
  int _previousState = -1;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    //监听滑动的距离
    _scrollViewController.addListener(() {
      double sH = _scrollViewController.position.pixels;
      debugPrint("滑动的距离：$sH");
      bool isChanged = sH > _flexibleSpaceHeight;
      _currentState = isChanged ? 1 : 0;
      //状态改变后更新顶部导航栏图标和标题的颜色
      if (_currentState != _previousState) {
        _headerNavigateColor = isChanged ? Colors.black : Colors.white;
        _headerTitleSize = isChanged ? 16 : 0;
        _previousState = _currentState;
        setState(() {});
      }
    });
    _tabController = TabController(vsync: this, length: 2);
    //网络获取数据
    _getDetailData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  void _getDetailData() async {
    final response = await http.get(URL_HOME_FIND_DETAIL);
    debugPrint("获取数据为：${response.body}");
    Map<String, dynamic> responseBody = json.decode(response.body);
    _headerData = HomeFindDetailEntity.fromJson(responseBody);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: _headerSliverBuilder,
              body: TabBarView(controller: _tabController, children: [
                HomeFindDetailListWidget(),
                HomeFindDetailListWidget()
              ]))),
    );
  }

  List<Widget> _headerSliverBuilder(BuildContext context,
      bool innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        child: SliverAppBar(
          backgroundColor: Colors.white,
          //阴影的高度
          elevation: 2,
          //显示阴影
          forceElevated: true,
          //所有图标样式
          iconTheme:
          IconThemeData(color: _headerNavigateColor, size: 22, opacity: 1),
          // pinned:是否固定导航栏，false为不固定，网上滑动会隐藏顶部的导航栏
          pinned: true,
          //floating:滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏
          floating: false,
          //snap:只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
          snap: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10), child: Icon(Icons.share))
          ],
          centerTitle: true,
          title: Text(widget.name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: _headerTitleSize)),
          //可滚动视图的高度
          expandedHeight: 240,
          flexibleSpace: FlexibleSpaceBar(
            //模式：pin：固定到位，直到达到最小范围； parallax：视差效果 ；none ：没有效果
            collapseMode: CollapseMode.pin,
            background: _headerViewBuilder(context),
          ),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.black,
              indicatorPadding: EdgeInsets.only(bottom: 6),
              labelPadding: EdgeInsets.only(bottom: 10),
              indicatorWeight: 2,
              controller: _tabController,
              tabs: [
                Text("推荐",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Text("广场",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black))
              ]),
        ),
      )
    ];
  }

  @override
  bool get wantKeepAlive => true;

  ///构建详情页面头部视图
  Widget _headerViewBuilder(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: _flexibleSpaceHeight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              "http://img.kaiyanapp.com/945fa937f0955b31224314a4eeef59b8.jpeg?imageMogr2/quality/100",
              fit: BoxFit.cover,
            ),
            _setHeaderContent()
          ],
        ),
      ),
    );
  }

  ///构建Header视图中的文字显示
  Widget _setHeaderContent() {
    if (_headerData == null) {
      return Container(
        alignment: Alignment.center,
        child: Text(
          "loading...",
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_headerData.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(_headerData.desc,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(height: 4),
          Text(
              "${_headerData.collectionCount} 人关注 | ${_headerData
                  .shareCount} 人看过",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal)),
          SizedBox(height: 14),
          Container(
            width: 58,
            height: 22,
            child: OutlineButton(
              onPressed: () {},
              child: Text(
                "+关注",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              borderSide: BorderSide(width: 1, color: Colors.white),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
          )
        ],
      );
    }
  }
}
