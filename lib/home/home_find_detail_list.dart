import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/common/Api.dart';
import 'package:flutter_eyepetizer/model/entity/HomeFindDetailListEntity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:video_player/video_player.dart';

/// 首页-发现-item详情-列表视图
class HomeFindDetailListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeFindDetailListWidgetState();
}

class _HomeFindDetailListWidgetState extends State<HomeFindDetailListWidget> {
  int _itemCount = 0;
  HomeFindDetailListEntity _listDatas;
  VideoPlayerController controller;
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    _getListData();
    //初始化播放控件
    controller = VideoPlayerController.network(
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4");
    //视频初始化
    controller.initialize().then((value) {
      initialized = true;
      //刷新页面显示播放器
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _itemCount,
          itemBuilder: _itemBuilder),
    );
  }

  ///构建ListViwe 的itemView 相当于Android中的Adapter
  Widget _itemBuilder(BuildContext context, int index) {
    DataListBean data = _listDatas.data[index];
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, right: 10,bottom: 0),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.only(left: 0, bottom: 0),
            leading: ClipOval(
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: 32,
                  height: 32,
                  placeholder: data.icon,
                  image: data.icon),
            ),
            title: Text(data.name,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(data.title,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
                maxLines: 1),
          ),
          Text(data.desc,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              maxLines: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _getVideoTagWidgets(data.tags),
          ),
          SizedBox(height: 8),
          _getVideoWidget()
        ],
      ),
    );
  }

  void _getListData() async {
    final response = await http.get(URL_HOME_FIND_DETAIL_LIST);
    debugPrint("获取的数据为：${response.body}");
    final Map<String, dynamic> responseBody = json.decode(response.body);
    _listDatas = HomeFindDetailListEntity.fromJson(responseBody);
    setState(() {
      _itemCount = _listDatas.data.length;
    });
  }

  ///构建Item中视频标签视图
  List<Widget> _getVideoTagWidgets(List<String> tags) {
    List<Widget> widgets = List();
    for (var value in tags) {
      widgets.add(Container(
        margin: EdgeInsets.only(top: 6, right: 4),
        padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
        decoration: BoxDecoration(
            color: Color.fromARGB(100, 173, 216, 230),
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          value,
          style: TextStyle(fontSize: 14, color: Colors.lightBlueAccent),
        ),
      ));
    }
    return widgets;
  }

  /// 构建item中视频播放控件
  Widget _getVideoWidget() {
    if (initialized) {
      final Size size = controller.value.size;
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: size.width / size.height,
                child: VideoPlayer(controller),
              )),
          GestureDetector(
            onTap: () {
              controller.play();
            },
            child: Icon(
              Icons.play_arrow,
              color: Colors.black12,
              size: 64,
            ),
          )
        ],
      );
    } else {
      return new Container();
    }
  }
}
