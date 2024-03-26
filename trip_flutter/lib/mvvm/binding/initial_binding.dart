import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/login/binding/login_bingding.dart';
import 'package:trip_flutter/mvvm/main/binding/main_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    MainBinding().dependencies();
    LoginBinding().dependencies();
  }
}
