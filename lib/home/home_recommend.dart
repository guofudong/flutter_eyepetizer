import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/common/Api.dart';
import 'package:flutter_eyepetizer/model/entity/HomeRecommendEntity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// 首页-推荐
class HomeRecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRecommendPageState();
}

class _HomeRecommendPageState extends State<HomeRecommendPage> {
  HomeRecommendEntity _recommendData;
  int _itemCount = 0;

  @override
  void initState() {
    super.initState();
    _getRecommendData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 8, right: 8),
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: _itemCount,
            itemBuilder: _itemBuilder,
            //item分割线
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                  height: 2.0, color: Color.fromARGB(32, 6, 6, 6), indent: 12);
            }),
      )),
    );
  }

  ///item 视图
  Widget _itemBuilder(BuildContext context, int index) {
    var recommendData = _recommendData.data[index];
    return Container(
      child: Column(
        children: <Widget>[
          //标题
          Padding(
            padding: EdgeInsets.all(4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(recommendData.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
            ),
          ),
          //主图片
          Stack(
            children: <Widget>[
              Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(recommendData.image,
                          fit: BoxFit.cover))),
              Positioned(
                  bottom: 12,
                  right: 10,
                  child: Text(recommendData.time,
                      style: TextStyle(fontSize: 14, color: Colors.white)))
            ],
          ),
          //作者
          ListTile(
            contentPadding: EdgeInsets.only(left: 8, bottom: 0, top: 0),
            leading: ClipOval(
                child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    width: 42,
                    height: 42,
                    placeholder: recommendData.author.icon,
                    image: recommendData.author.icon)),
            title: Text(recommendData.author.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(recommendData.author.slogan,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                maxLines: 1),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, bottom: 6),
            child: ListView.builder(
              //Colum嵌套ListView时，设置该属性，否则不显示ListView
              shrinkWrap: true,
              //禁止滑动
              physics: NeverScrollableScrollPhysics(),
              itemCount: recommendData.list.length,
              itemBuilder: (context, index) {
                return _subItemBuilder(context, index, recommendData);
              },
            ),
          )
        ],
      ),
    );
  }

  ///获取推荐数据
  void _getRecommendData() async {
    final response = await http.get(URL_HOME_RECOMMEND);
    debugPrint("首页推荐数据为：${response.body}");
    final Map<String, dynamic> responseBody = json.decode(response.body);
    _recommendData = HomeRecommendEntity.fromJson(responseBody);
    setState(() {
      _itemCount = _recommendData.data.length;
    });
  }

  Widget _subItemBuilder(
      BuildContext context, int index, DataListBean recommendData) {
    var data = recommendData.list[index];
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: 100,
                      child: Image.network(data.image, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      child: Text(data.time,
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ))
              ],
            )),
        Expanded(
            flex: 1,
            child: Container(
              height: 100,
              padding: EdgeInsets.only(top: 4, bottom: 4,left: 8),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Text(data.title,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Text(recommendData.name,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                        maxLines: 1),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
