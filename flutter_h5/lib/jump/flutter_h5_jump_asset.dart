import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///通过loadFlutterAssets的方式加载H5
class FlutterH5AssetJump extends StatefulWidget {
  const FlutterH5AssetJump({super.key});

  @override
  State<FlutterH5AssetJump> createState() => _FlutterH5AssetJumpState();
}

class _FlutterH5AssetJumpState extends State<FlutterH5AssetJump> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          _onLoadFlutterAssets(context);
        },
        child: const Text('加载H5', style: TextStyle(color: Colors.white)),
      );

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通过loadFlutterAssets的方式加载H5'),
        actions: [_loadBtn],
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  void _onLoadFlutterAssets(BuildContext context) async {
    //加载项目assets/hiH5/目录下的index.htm文件
    //注意：assets目录增删或修改过文件后，需要先停止项目运行，然后重新运行和编译项目才能生效，否则加载不到，报：path resulted in a nil value., null)错误
    await controller.loadFlutterAsset('assets/hiH5/index.html');
  }
}
