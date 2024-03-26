import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5JS2FlutterByUrl = '''
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <title>通过URL向flutter传递参数</title>
</head>

<body>
    <button id="btn" style="font-size: 2.5em">传递参数</button>
    <script type="text/javascript">
        var btn = document.getElementById("btn");
        btn.addEventListener('click', function () {
            //通过URL向flutter传递参数
            document.location = "hi://webview?name=geekailab";
        }, false)
    </script>
</body>

</html>
''';

class JS2FlutterByUrl extends StatefulWidget {
  const JS2FlutterByUrl({super.key});

  @override
  State<JS2FlutterByUrl> createState() => _JS2FlutterByUrlState();
}

class _JS2FlutterByUrlState extends State<JS2FlutterByUrl> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          //用loadHtmlString加载string格式的HTML
          controller.loadHtmlString(h5JS2FlutterByUrl);
        },
        child: const Text('加载H5', style: TextStyle(color: Colors.white)),
      );

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      //开启JS执行
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            //约定一个通信协议 hi://webview
            if (request.url.startsWith('hi://webview')) {
              debugPrint('处理JS通过URL传递过来的数据： $request');
              Uri uri = Uri.parse(request.url);
              //解析数据
              var name = uri.queryParameters['name'];
              debugPrint('name:$name');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('name:$name')),
              );
              return NavigationDecision.prevent; //不跳转；
            }
            debugPrint('非hi://webview开头的URL则放行 $request');
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JS向Flutter传递数据'), actions: [_loadBtn]),
      body: WebViewWidget(controller: controller),
    );
  }
}
