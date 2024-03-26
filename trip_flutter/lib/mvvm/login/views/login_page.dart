import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/login/controllers/controller.dart';
import 'package:trip_flutter/util/view_util.dart';
import 'package:trip_flutter/widget/input_widget.dart';
import 'package:trip_flutter/widget/login_button_widget.dart';

class LoginPage extends GetView<LoginViewModel> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘弹起影响布局
      body: Stack(
        children: [..._background(), _content()],
      ),
    );
  }

  //  背景
  _background() {
    return [
      Positioned.fill(
        child: Image.asset("images/login-bg1.jpg", fit: BoxFit.cover),
      ),
      Positioned.fill(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black54),
        ),
      ),
    ];
  }

  //  内容
  _content() {
    return Positioned.fill(
      left: 25,
      right: 25,
      child: ListView(
        children: [
          hiSpace(height: 100),
          const Text(
            "账号密码登录",
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          hiSpace(height: 40),
          InputWidget(
            '请输入账号',
            onChanged: (text) => controller.onValueChanged(
              text,
              LoginInputType.userName,
            ),
          ),
          hiSpace(height: 10),
          InputWidget(
            '请输入密码',
            obscureText: true,
            onChanged: (text) => controller.onValueChanged(
              text,
              LoginInputType.password,
            ),
          ),
          hiSpace(height: 45),
          LoginButton(
            '登录',
            enable: controller.loginEnable.value,
            onPressed: controller.login,
          ),
          hiSpace(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: controller.jumpRegistration,
              child: const Text(
                '注册账号',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
