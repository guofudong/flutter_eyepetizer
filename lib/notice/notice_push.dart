import 'package:flutter/material.dart';

/// 通知-推送
class NoticePushPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView.separated(
          itemCount: 12,
          itemBuilder: _itemBuilder, //item分割线
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
                height: 2.0, color: Color.fromARGB(32, 6, 6, 6), indent: 40);
          }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Flex(
      direction: Axis.horizontal,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 14,left: 10),
            width: 38,
            height: 38,
            child: Image.asset("images/ic_action_focus.png"),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Color.fromARGB(32, 0, 0, 0), width: 1.0))),
        Expanded(
            flex: 1,
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("开眼社区",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Text("2天前",
                        style: TextStyle(
                            color: Color.fromARGB(100, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "拍摄你目光所及的赛博朋克瞬间，赢取开眼限量礼品福袋>>",
                        style: TextStyle(
                            color: Color.fromARGB(180, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ))
                ],
              ),
            )),
        IconButton(
            icon: Icon(Icons.chevron_right, size: 20, color: Colors.black),
            onPressed: null)
      ],
    );
  }
}
