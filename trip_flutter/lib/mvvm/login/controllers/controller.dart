import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/util/navigator_util.dart';
import 'package:url_launcher/url_launcher.dart';

enum LoginInputType {
  userName,
  password,
}

class LoginViewModel extends GetxController {
  final loginEnable = false.obs;
  String? userName;
  String? password;

  void onValueChanged(String value, LoginInputType type) {
    if (type == LoginInputType.userName) {
      userName = value;
    } else {
      password = value;
    }

    loginEnable(userName != null &&
        userName!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty);
  }

  /// 登录
  login() async {
    try {
      var result =
          await LoginDao.login(userName: userName!, password: password!);
      debugPrint('login success');
      NavigatorUtil.gotoHome();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// 注册
  jumpRegistration() async {
    // 跳转h5注册页面
    Uri uri = Uri.parse(
        "https://api.geekailab.com/uapi/swagger-ui.html#/Account/registrationUsingPOST");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch $uri";
    }
  }
}
