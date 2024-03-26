import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:get/get.dart';
import 'package:trip_flutter/dao/cache_util.dart';
import 'package:trip_flutter/mvvm/binding/initial_binding.dart';
import 'package:trip_flutter/mvvm/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter之旅',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppPages.init,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      // home: FutureBuilder<dynamic>(
      //   future: HiCache.preInit(),
      //   // future: _doInit(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //     // 屏幕大小适配案例
      //     // return const ScreenFixPage();
      //     ScreenHelper.init(context);
      //
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (LoginDao.getBoardingPass() == null) {
      //         return const LoginPage();
      //       } else {
      //         return const TabNavigator();
      //       }
      //     } else {
      //       return const Scaffold(
      //         body: Center(child: CircularProgressIndicator()),
      //       );
      //     }
      //   },
      // ),
    );
  }

  Future<void> _doInit() async {
    await HiCache.preInit();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        FlutterSplashScreen.hide();
      },
    );
  }
}
