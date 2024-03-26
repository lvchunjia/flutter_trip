import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/main/controllers/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainViewModel>(() => MainViewModel());
  }
}
