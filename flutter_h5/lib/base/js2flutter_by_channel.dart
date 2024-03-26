import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5JS2FlutterByChannel = '''
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <title>通过javascriptChannels向flutter传递参数</title>
</head>

<body>
    <button id="btn" style="font-size: 2.5em">通过javascriptChannels向flutter传递参数</button>
    <script type="text/javascript">
        var btn = document.getElementById("btn");
        btn.addEventListener('click', function () {
           //通过注册的hiPop channel向flutter发送消息
           hiPop.postMessage("Hi Pop");
        }, false)
    </script>
</body>

</html>
''';

///JS向Flutter传递数据-通过javascriptChannels的方式
class JS2FlutterByChannel extends StatefulWidget {
  const JS2FlutterByChannel({super.key});

  @override
  State<JS2FlutterByChannel> createState() => _JS2FlutterByChannelState();
}

class _JS2FlutterByChannelState extends State<JS2FlutterByChannel> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          controller.loadHtmlString(h5JS2FlutterByChannel);
        },
        child: const Text('加载H5', style: TextStyle(color: Colors.white)),
      );

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      //开启JS执行
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'hiPop',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JS向Flutter传递数据'),
        actions: [_loadBtn],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
