import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String h5String = '''
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <title>通过URL向flutter传递参数</title>
</head>

<body>
    <div id="btn" style="font-size: 2.5em">Hi h5 file</div>
</body>

</html>
''';

class FlutterH5FileJump extends StatefulWidget {
  const FlutterH5FileJump({super.key});

  @override
  State<FlutterH5FileJump> createState() => _FlutterH5FileJumpState();
}

class _FlutterH5FileJumpState extends State<FlutterH5FileJump> {
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          _onLoadLocalFileExample(context);
        },
        child: const Text("加载H5", style: TextStyle(color: Colors.white)),
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
        title: const Text('通过loadFile的方式加载H5'),
        actions: [_loadBtn],
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  void _onLoadLocalFileExample(BuildContext context) async {
    //如果已知H5文件的本地路径可以忽略这一步；因为没有本地的H5文件，所以我们将上面的H5 String保存成一个文件来加载；
    final String path = await _prepareFile();
    debugPrint(path);
    await controller.loadFile(path);
  }

  ///将H5 String保存都本地
  _prepareFile() async {
    final tmpDir = (await getTemporaryDirectory()).path;
    //创建文件
    final File file =
        File(<String>{tmpDir, 'hi', 'index.html'}.join(Platform.pathSeparator));
    await file.create(recursive: true);
    //向文件写入H5 string数据
    await file.writeAsString(h5String);
    return file.path;
  }
}
