import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///Flutter向JS传递数据-通过URL的方式
class Flutter2JSByUrl extends StatefulWidget {
  const Flutter2JSByUrl({super.key});

  @override
  State<Flutter2JSByUrl> createState() => _Flutter2JSByUrlState();
}

class _Flutter2JSByUrlState extends State<Flutter2JSByUrl> {
  int progress = 0;
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          //通过URL向H5传递数据
          controller.loadRequest(
            Uri.parse(
                'https://www.geekailab.com/io/flutter-trip/Flutter2JSByUrl.html?name=geekailab'),
          );
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
        NavigationDelegate(onProgress: (progress) {
          setState(() {
            this.progress = progress;
          });
        }),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter向JS传递数据'),
        actions: [_loadBtn],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          Positioned(bottom: 100, left: 100, child: Text('加载进度：$progress'))
        ],
      ),
    );
  }
}
