import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../util/navigator_util.dart';

///H5容器
class HiWebView extends StatefulWidget {
  final String? url;
  final String? statusBarColor;
  final String? title;
  final bool? hideAppBar;
  //禁止我的页面返回按钮
  final bool? backForbid;

  const HiWebView(
      {super.key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid});

  @override
  State<HiWebView> createState() => _HiWebViewState();
}

class _HiWebViewState extends State<HiWebView> {
  //主页代表的url
  final _catchUrls = [
    'm.ctrip.com/',
    'm.ctrip.com/html5/',
    'm.ctrip.com/html5'
  ];
  String? url;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    url = widget.url;
    if (url != null && url!.contains('ctrip.com')) {
      //fix 携程H5 http://无法打开问题
      url = url!.replaceAll("http://", "https://");
    }

    _initWebViewController();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    //处理Android物理返回键，返回H5的上一页 https://docs.flutter.dev/release/breaking-changes/android-predictive-back
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        if (await controller.canGoBack()) {
          //返回H5的上一页
          controller.goBack();
        } else {
          if (context.mounted) NavigatorUtil.pop(context);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            _appBar(
              Color(int.parse('0xff$statusBarColorStr')),
              backButtonColor,
            ),
            Expanded(child: WebViewWidget(controller: controller))
          ],
        ),
      ),
    );
  }

  void _initWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('progress:$progress');
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            //页面加载完成之后才能执行JS
            _handleBackForbid();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (_isToMain(request.url)) {
              debugPrint('阻止跳转到 $request}');
              //返回到flutter页面
              NavigatorUtil.pop(context);
              return NavigationDecision.prevent;
            }
            debugPrint('允许跳转到 $request}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url!));
  }

  ///隐藏H5登录页的返回键
  void _handleBackForbid() {
    const jsStr =
        "var element = document.querySelector('.animationComponent.rn-view'); element.style.display = 'none';";
    if (widget.backForbid ?? false) {
      controller.runJavaScript(jsStr);
    }
  }

  ///判断H5是否返回主页
  bool _isToMain(String url) {
    bool contain = false;
    for (final value in _catchUrls) {
      if (url.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  _appBar(Color backgroundColor, Color backButtonColor) {
    //获取刘海屏Top安全边距
    double top = MediaQuery.of(context).padding.top;
    if (widget.hideAppBar ?? false) {
      return Container(
        color: backgroundColor,
        height: top,
      );
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, top + 10, 0, 10),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: [_backButton(backButtonColor), _title(backButtonColor)],
        ),
      ),
    );
  }

  _backButton(Color backButtonColor) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Icon(Icons.close, color: backButtonColor, size: 26),
      ),
    );
  }

  _title(Color backButtonColor) {
    return Positioned(
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          widget.title ?? "",
          style: TextStyle(color: backButtonColor, fontSize: 20),
        ),
      ),
    );
  }
}
