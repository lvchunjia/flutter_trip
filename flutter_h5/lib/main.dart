import 'package:flutter/material.dart';

import 'base/flutter2js_by_runJavaScript.dart';
import 'base/flutter2js_by_url.dart';
import 'base/js2flutter_by_channel.dart';
import 'base/js2flutter_by_url.dart';
import 'jump/flutter_h5_jump_asset.dart';
import 'jump/flutter_h5_jump_html_file.dart';
import 'login/flutter_h5_login_sync_by_cookie.dart';
import 'login/flutter_h5_sync_by_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _navButton(
              context,
              const JS2FlutterByUrl(),
              'JS向Flutter传递数据-通过URL的方式)',
            ),
            _navButton(
              context,
              const JS2FlutterByChannel(),
              'JS向Flutter传递数据-通过Channel的方式',
            ),
            _navButton(
              context,
              const Flutter2JSByUrl(),
              'Flutter向JS传递数据-通过URL的方式',
            ),
            _navButton(
              context,
              const Flutter2JSByRunJavascript(),
              'Flutter向JS传递数据-通过runJavascriptL的方式',
            ),
            _navButton(
              context,
              const FlutterH5AssetJump(),
              '通过loadFlutterAssets的方式加载H5',
            ),
            _navButton(context, const FlutterH5FileJump(), '通过loadFile的方式加载H5'),
            _navButton(
              context,
              const FlutterH5LoginCookie(),
              'Flutter通过cookie的方式将登录态同步给H5',
            ),
            _navButton(
              context,
              const FlutterH5LoginChannel(),
              'Flutter通过Channel的方式将登录态同步给H5',
            )
          ],
        ),
      ),
    );
  }

  _navButton(BuildContext context, Widget page, String title) {
    return FilledButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => page),
        );
      },
      child: Text(title),
    );
  }
}
