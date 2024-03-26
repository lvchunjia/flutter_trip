import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/login/controllers/controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}
