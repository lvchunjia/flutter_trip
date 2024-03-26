import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/routes/app_pages.dart';

import '../widget/hi_webview.dart';

class NavigatorUtil {
  /// 用于在获取不到context的地方，如dao中跳转页面时使用，需要在TabNavigator赋值
  /// 注意：若TabNavigator被销毁，_context将无法使用
  // static BuildContext? _context;

  // static void updateContext(BuildContext context) {
  //   NavigatorUtil._context = context;
  //   // print('init$context');
  // }

  /// 跳转到指定页面
  static push(BuildContext context, Widget page) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    Get.to(page);
  }

  /// 跳转到首页
  static gotoHome() {
    // 跳转到主页并不让返回，当封装了导航页之后，就不需要再跳转到HomePage了
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const HomePage()));
    // Get.offAll(const TabNavigator());
    Get.offAllNamed(Routes.MAIN);
  }

  ///跳转到登录页
  static goToLogin() {
    //跳转到主页并不让返回
    // Navigator.pushReplacement(
    //     _context!, MaterialPageRoute(builder: (context) => const LoginPage()));
    // Get.off(const LoginPage());
    Get.offNamed(Routes.LOGIN);
  }

  ///返回上一页
  static pop(BuildContext context) {
    // if (Navigator.canPop(context)) {
    //   Navigator.pop(context);
    // } else {
    //   //退出APP
    //   SystemNavigator.pop();
    // }
    Get.back();
  }

  ///跳转H5页面
  static jumpH5(
      {BuildContext? context,
      String? url,
      String? title,
      bool? hideAppBar,
      String? statusBarColor}) {
    BuildContext? safeContext;

    if (url == null) {
      debugPrint('url is null jumpH5 failed.');
      return;
    }

    Get.to(
      HiWebView(
        url: url,
        title: title,
        hideAppBar: hideAppBar,
        statusBarColor: statusBarColor,
      ),
    );
    // if (context != null) {
    //   safeContext = context;
    // } else if (_context?.mounted ?? false) {
    //   safeContext = _context;
    // } else {
    //   debugPrint('context is null jumpH5 failed.');
    //   return;
    // }
    // Navigator.push(
    //   safeContext!,
    //   MaterialPageRoute(
    //     builder: (context) => HiWebView(
    //       url: url,
    //       title: title,
    //       hideAppBar: hideAppBar,
    //       statusBarColor: statusBarColor,
    //     ),
    //   ),
    // );
  }
}
