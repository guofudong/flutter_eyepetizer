import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/common/Api.dart';
import 'package:flutter_eyepetizer/common/common_webview.dart';
import 'package:flutter_eyepetizer/model/entity/HomeDailyEntity.dart';
import 'package:http/http.dart' as http;

/// 首页-日报
class HomeDailyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeDailyPageState();
}

class _HomeDailyPageState extends State<HomeDailyPage> {
  HomeDailyEntity _daulyData;
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
          itemCount: _itemCount,
          itemBuilder: _itemBuilder,
          //item分割线
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
                height: 2.0, color: Color.fromARGB(32, 6, 6, 6), indent: 12);
          }),
    ));
  }

  @override
  void initState() {
    super.initState();
    _getDailyData();
  }

  ///构建ListView item视图
  Widget _itemBuilder(BuildContext context, int index) {
    var itemData = _daulyData.itemList[index].data;
    String videoTime;
    if(itemData.duration >= 60){
      int second = itemData.duration % 60;
      String temp = second < 10 ? "0$second" : second.toString();
      videoTime = "0" +
          (itemData.duration ~/ 60).toString() +":$temp";
    }else{
      videoTime =  "00:${itemData.duration}";
    }
    return Container(
      child: Column(
        children: <Widget>[
          //标题
          getTitleWidget(index),
          //主图片
          Stack(
            children: <Widget>[
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: GestureDetector(
                        onTap: (){
                          _itemClick(itemData);
                        },
                        child: Image.network(itemData.cover.feed,
                            fit: BoxFit.cover)),
                      )),
              Positioned(
                  bottom: 12,
                  right: 10,

                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: Text(videoTime,
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                  ))
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
                    placeholder: itemData.author.icon,
                    image: itemData.author.icon)),
            title: Text(itemData.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(itemData.author.name + " / #" + itemData.category,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                maxLines: 1),
          ),
        ],
      ),
    );
  }

  ///获取日报数据
  void _getDailyData() async {
    final response = await http.get(URL_HOME_DAILY);
    debugPrint("首页日报数据为：${response.body}");
    final Map<String, dynamic> responseBody = json.decode(response.body);
    _daulyData = HomeDailyEntity.fromJson(responseBody);
    setState(() {
      _itemCount = _daulyData.itemList.length;
    });
  }

  Widget getTitleWidget(int index) {
    if (index % 3 == 0) {
      return Padding(
        padding: EdgeInsets.all(4),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("今日推荐",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22)),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.all(0));
    }
  }

  ///ListView item点击事件处理
  void _itemClick(DataBean itemData) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WebViewPage(url: itemData.webUrl.raw);
    }));
  }
}
