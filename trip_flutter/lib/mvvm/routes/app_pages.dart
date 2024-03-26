import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/login/binding/login_bingding.dart';
import 'package:trip_flutter/mvvm/login/views/login_page.dart';
import 'package:trip_flutter/mvvm/main/binding/main_binding.dart';
import 'package:trip_flutter/mvvm/main/views/main_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const init = Routes.MAIN;
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
