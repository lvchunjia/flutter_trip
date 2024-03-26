import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5loginInfo = '''
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <title>/Flutter通过Channel的方式将登录态同步给H5</title>
</head>

<body>
    <button id="btn" style="font-size: 2.5em">获取登录信息</button>
    <div id="resultTxt" style="font-size: 2.5em">这里展示Flutter传递过来的数据</button>
    <script type="text/javascript">
        var btn = document.getElementById("btn");
        btn.addEventListener('click', function () {
           //通过注册的getLoginInfo channel向flutter发送消息
           getLoginInfo.postMessage("");
        }, false)
        function hiCallJs(msg) {
            document.getElementById('resultTxt').innerHTML = 'Flutter传递过来的登录信息：' + msg;
        }
    </script>
</body>

</html>
''';

///Flutter通过Channel的方式将登录态同步给H5
class FlutterH5LoginChannel extends StatefulWidget {
  const FlutterH5LoginChannel({super.key});

  @override
  State<FlutterH5LoginChannel> createState() => _FlutterH5LoginChannelState();
}

class _FlutterH5LoginChannelState extends State<FlutterH5LoginChannel> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          controller.loadHtmlString(h5loginInfo);
        },
        child: const Text('加载H5', style: TextStyle(color: Colors.white)),
      );

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'getLoginInfo',
        onMessageReceived: (JavaScriptMessage message) {
          //获取到H5需要登录信息的调用
          var info = {'token': "67890hjdsfd", 'uid': "3242"};
          var infoString = json.encode(info);
          controller.runJavaScript("hiCallJs('$infoString')"); //将登录信息传递个H5
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter通过Channel的方式将登录态同步给H5'),
        actions: [_loadBtn],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
