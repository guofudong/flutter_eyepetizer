import 'package:flutter/material.dart';

typedef HeaderWidgetBuild = Widget Function(BuildContext context, int position);
typedef ItemWiggetBuild = Widget Function(BuildContext context, int position);

class ListMultiView extends StatefulWidget {
  final List listData;
  final List headerListData;
  final HeaderWidgetBuild headerWidgetCreator;
  final ItemWiggetBuild itemWidgetCreator;

  ListMultiView(this.listData,
      {Key key,
      this.headerListData,
      this.headerWidgetCreator,
      this.itemWidgetCreator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListMultiViewState();
}

class _ListMultiViewState extends State<ListMultiView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _getListItemCount(),
      itemBuilder: _itemBuilder,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
            height: 2.0, color: Color.fromARGB(32, 6, 6, 6), indent: 12);
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < _getHeaderCount()) {
      return widget.headerWidgetCreator(context, index);
    } else {
      int position = index - _getHeaderCount();
      return widget.itemWidgetCreator(context, position);
    }
  }

  ///获取ListView item总的数量
  int _getListItemCount() {
    return widget.listData.length + _getHeaderCount();
  }

  ///获取header数量
  int _getHeaderCount() {
    return widget.headerListData != null ? widget.headerListData.length : 0;
  }
}
