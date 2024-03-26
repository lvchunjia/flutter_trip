import 'package:flutter/material.dart';
import 'package:trip_flutter/dao/cache_util.dart';
import 'package:trip_flutter/dao/login_dao.dart';
import 'package:trip_flutter/mvvm/main/views/bottom_tab_view.dart';
import 'package:trip_flutter/pages/login_page.dart';
import 'package:trip_flutter/util/screen_adapter_helper.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: HiCache.preInit(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        ScreenHelper.init(context);

        if (snapshot.connectionState == ConnectionState.done) {
          if (LoginDao.getBoardingPass() == null) {
            return const LoginPage();
          } else {
            return const BottomTabView();
          }
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
