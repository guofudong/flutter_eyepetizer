import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///公共WebView页面
class WebViewPage extends StatefulWidget {
  ///加载地址
  final String url;

  WebViewPage({this.url});

  @override
  State<StatefulWidget> createState() => _WebViewPage();
}

class _WebViewPage extends State<WebViewPage> {
  FlutterWebviewPlugin flutterWebViewPlugin = FlutterWebviewPlugin();
  /// WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> onStateChanged;
  /// 是否是加载中
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.abortLoad:
          break;
        case WebViewState.shouldStart:
          // 准备加载
          setState(() {
            isLoading = true;
          });
          break;
        case WebViewState.startLoad:
          // 开始加载
          break;
        case WebViewState.finishLoad:
          // 加载完成
        setState(() {
          isLoading = false;
        });
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WebviewScaffold(
            withJavascript: true,
            withZoom: false,
            withLocalStorage: true,
            url: widget.url));
  }

  @override
  void dispose() {
    // 回收资源
    onStateChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }
}
