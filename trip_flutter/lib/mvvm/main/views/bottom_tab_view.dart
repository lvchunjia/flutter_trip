import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/mvvm/main/controllers/controller.dart';
import 'package:trip_flutter/pages/home_page.dart';
import 'package:trip_flutter/pages/my_page.dart';
import 'package:trip_flutter/pages/search_page.dart';
import 'package:trip_flutter/pages/travel_page.dart';

class BottomTabView extends GetView<MainViewModel> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;

  const BottomTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView(
          controller: controller.controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            SearchPage(hideLeft: true, keyword: '北京'),
            TravelPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.blue,
          currentIndex: controller.currentIndex.value,
          onTap: controller.onBottomNavTap,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页', Icons.home, 0),
            _bottomItem('搜索', Icons.search, 1),
            _bottomItem('旅拍', Icons.camera_alt, 2),
            _bottomItem('我的', Icons.account_circle, 3),
          ],
        ),
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: _defaultColor),
      activeIcon: Icon(icon, color: _activeColor),
      label: title,
    );
  }
}
