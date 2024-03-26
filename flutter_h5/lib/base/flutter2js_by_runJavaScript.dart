import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5Flutter2JSByrunJavaScript = '''
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>Flutter向H5传递数据-通过runJavaScript</title>
    <script type="text/javascript">
        function hiCallJs(msg) {
            document.getElementById('resultTxt').innerHTML = 'Flutter传递过来的数据：' + msg;
        }
        function hiCallJsWithResult(v1, v2) {
            return parseInt(v1) + parseInt(v2);
        }
    </script>
</head>
<body>
    <div id="resultTxt" style="font-size: 2.5em">这里展示Flutter传递过来的数据</button>
</body>
</html>
''';

///Flutter向JS传递数据-通过runJavascript
class Flutter2JSByRunJavascript extends StatefulWidget {
  const Flutter2JSByRunJavascript({super.key});

  @override
  State<Flutter2JSByRunJavascript> createState() =>
      _Flutter2JSByRunJavascriptState();
}

class _Flutter2JSByRunJavascriptState extends State<Flutter2JSByRunJavascript> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          //用loadHtmlString加载string格式的HTML
          controller.loadHtmlString(h5Flutter2JSByrunJavaScript);
        },
        child: const Text("加载H5", style: TextStyle(color: Colors.white)),
      );

  get _fireData => FilledButton(
        onPressed: () async {
          var name = 'geekailab1';
          //runJavaScript的运行要在H5页面加载完成后进行否则会报：Failed evaluating JavaScript.
          controller
              .runJavaScript("hiCallJs('$name')"); //这里$name前后需要带''，否则格式检测不通过
          var result = await controller
              .runJavaScriptReturningResult("hiCallJsWithResult(2,2)");
          debugPrint('来在JS的计算结果：$result');
        },
        child: const Text('发送数据', style: TextStyle(color: Colors.white)),
      );

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      //开启JS执行
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter向JS传递数据'),
        actions: [_loadBtn, _fireData],
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
