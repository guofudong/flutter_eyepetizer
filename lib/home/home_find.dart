import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/home/home_find_detail.dart';
import 'package:flutter_eyepetizer/model/HomeFind.dart';
import 'package:flutter_eyepetizer/widget/widget_listmultiview.dart';

/// 首页-发现
class HomeFindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeFindPageState();
}

class _HomeFindPageState extends State<HomeFindPage> {
  List<HomeFind> _listData = homeFindList;
  List<String> _headerDatas = ["我是头部"];
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListMultiView(_listData,
          itemWidgetCreator: _itemWidgetCreator,
          headerListData: _headerDatas,
          headerWidgetCreator: _headerWidgetCreator),
    );
  }

  /// 创建列表Header内容视图
  Widget _headerWidgetCreator(BuildContext context, int position) {
    return Container(
      height: 180,
      alignment: Alignment.center,
      child: PageView(
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        controller: PageController(initialPage: 0, viewportFraction: 0.95),
        children: <Widget>[
          _getHeaderItemView(0),
          _getHeaderItemView(1),
          _getHeaderItemView(2),
          _getHeaderItemView(3),
          _getHeaderItemView(4),
        ],
      ),
    );
  }

  /// 网络获取数据
  void _getData() async {}

  /// 构建列表item内容视图
  Widget _itemWidgetCreator(BuildContext context, int position) {
    //热门分类
    if (position == 0) {
      // Padding用来设置间距
      return Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            //Row：行布局，相当于LinearLayout的horizontal
            Row(
              children: <Widget>[
                //Align :可以设置子控件的对其方式
                Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text("热门分类",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22)))
              ],
            ),
            //用来设置垂直方向的间距 相当于Android中的View
            SizedBox(height: 6),
            SizedBox(
                height: 240,
                child: GridView.builder(
                    //滑动方向
                    scrollDirection: Axis.horizontal,
                    itemCount: homeFindList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    //相当于Android中的Adapter
                    itemBuilder: _gridViewItemBuilder))
          ],
        ),
      );
    } else if (position == 1) {
      //开眼栏目
      return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
        child: SizedBox(
            height: 240,
            child: Column(
              children: <Widget>[
                SizedBox(height: 8),
                Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text("开眼栏目",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22))),
                SizedBox(height: 6),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      _getGridViewItem2(0),
                      _getGridViewItem2(1)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      _getGridViewItem2(2),
                      _getGridViewItem2(3)
                    ],
                  ),
                )
              ],
            )),
      );
    } else {
      //推荐主题
      int index = position % homeFindList2.length;
      _count++;
      debugPrint("索引值：$index");
      final titles = ["推荐主题", "推荐作者"];
      final isNewType = _count == 5;
      String title = isNewType ? titles[1] : titles[0];
      return GestureDetector(
        onTap: () {
          //跳转到详情页面
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return HomeFindDetail(name: homeFindList1[index].name);
          }));
        },
        child: Column(
          children: <Widget>[
            Offstage(
                offstage: index != 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8),
                      Align(
                          alignment: FractionalOffset.centerLeft,
                          child: Text(title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 22))),
                      SizedBox(height: 6)
                    ],
                  ),
                )),
            ListTile(
              contentPadding:
                  EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 10),
              leading: isNewType
                  ? ClipOval(
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          width: 46,
                          height: 46,
                          placeholder: homeFindList2[index].bgPicture,
                          image: homeFindList2[index].bgPicture),
                    )
                  : Container(
                      width: 46,
                      height: 46,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          homeFindList2[index].bgPicture,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              title: Text(
                homeFindList2[index].name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Text(homeFindList2[index].description),
              trailing: Container(
                width: 48,
                height: 20,
                child: OutlineButton(
                  padding: EdgeInsets.all(0),
                  disabledBorderColor: Colors.black,
                  borderSide: BorderSide(width: 0.2),
                  child: Text(
                    "+关注",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  ///开眼栏目item内容视图
  Widget _getGridViewItem2(int index) {
    return Expanded(
        //控件权重，同Android中LinearLayout的weight
        flex: 1,
        //手势识别器，这里用来监听item的点击监听
        child: GestureDetector(
          onTap: () {
            //跳转到详情页面
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return HomeFindDetail(name: homeFindList1[index].name);
            }));
          },
          child: Card(
            //z轴的距离，显示阴影效果
            elevation: 0.2,
            margin: EdgeInsets.all(2),
            clipBehavior: Clip.antiAlias,
            //Stack:相当于Android中的FrameLayout，重叠布局
            child: Stack(
                alignment: Alignment.center,
                //填充方式
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    homeFindList1[index].bgPicture,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    //列布局，相当于Android中的LinearLayout中的vertical
                    child: Column(
                      //主轴的对其方式，对于Column来说主轴方法为垂直方向
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("#${homeFindList1[index].name}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text(homeFindList1[index].description,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white))
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  ///热门分类item内容视图
  Widget _gridViewItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        debugPrint("点击了${homeFindList[index].name}");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return HomeFindDetail(name: homeFindList[index].name);
        }));
      },
      child: Card(
        elevation: 0.2,
        margin: EdgeInsets.all(2),
        clipBehavior: Clip.antiAlias,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Image.network(
            homeFindList[index].bgPicture,
            fit: BoxFit.cover,
          ),
          Text("#${homeFindList[index].name}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ]),
      ),
    );
  }

  ///列表头部PageView的item内容视图
  Widget _getHeaderItemView(int index) {
    return Card(
      //显示圆角
      clipBehavior: Clip.antiAlias,
      child: Image.network(homeFindHeaderDatas[index].bgPicture,
          fit: BoxFit.cover),
    );
  }
}
