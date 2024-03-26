import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///Flutter通过cookie的方式将登录态同步给H5
class FlutterH5LoginCookie extends StatefulWidget {
  const FlutterH5LoginCookie({super.key});

  @override
  State<FlutterH5LoginCookie> createState() => _FlutterH5LoginCookieState();
}

class _FlutterH5LoginCookieState extends State<FlutterH5LoginCookie> {
  WebViewCookieManager cookieManager = WebViewCookieManager();
  late WebViewController controller;

  get _loadBtn => FilledButton(
        onPressed: () {
          controller.loadRequest(
            Uri.parse(
              'https://geekailab.com/io/flutter-trip/Flutter2JSByUrl.html?name=geekailab',
            ),
          );
        },
        child: const Text("加载H5", style: TextStyle(color: Colors.white)),
      );

  get _setCookieBtn => FilledButton(
        onPressed: () {
          _onSetCookie(context);
        },
        child: const Text(
          "设置Cookie",
          style: TextStyle(color: Colors.white),
        ),
      );

  get _clearCookieBtn => FilledButton(
        onPressed: () {
          _onClearCookie(context);
        },
        child: const Text("清楚Cookie", style: TextStyle(color: Colors.white)),
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
        title: const Text('Flutter通过cookie的方式将登录态同步给H5'),
        actions: [_loadBtn, _setCookieBtn, _clearCookieBtn],
      ),
      body: WebViewWidget(controller: controller),
    );
  }

  ///设置cookie
  void _onSetCookie(BuildContext context) async {
    //可以连续设置多次cookie
    await cookieManager.setCookie(const WebViewCookie(
      name: 'token', //cookie的名字
      value: 'sfsdfsfwer123123fdasd', //cookie的值
      domain: 'geekailab.com', //指定给对应的域名设置cookie
      path: '/', //域名下的路径，可以缺省，若设置一个具体的path，那么只有这个path下的网址才可以获取到设置的cookie
    ));
    await cookieManager.setCookie(const WebViewCookie(
      name: 'uid', //cookie的名字
      value: '8822100', //cookie的值
      domain: 'geekailab.com', //指定给对应的域名设置cookie
      path: '', //域名下的路径，可以缺省，若设置一个具体的path，那么只有这个path下的网址才可以获取到设置的cookie
    ));
    //也可在Flutter中获取cookie
    final Object cookies =
        await controller.runJavaScriptReturningResult('document.cookie');
    debugPrint('cookie: ${cookies.toString()}');
  }

  ///清除cookie
  void _onClearCookie(BuildContext context) async {
    await cookieManager.clearCookies();
    debugPrint('cookie清除成功');
  }
}
