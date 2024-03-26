import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/home_model.dart';
import '../util/navigator_util.dart';
import 'header_util.dart';

/// 首页接口
class HomeDao {
  static Future<HomeModel?> fetch() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/ft/home');

    final response = await http.get(url, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder(); //fix 中文乱码
    String bodyString = utf8decoder.convert(response.bodyBytes);

    debugPrint(bodyString);
    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      return HomeModel.fromJson(result['data']);
    } else {
      if (response.statusCode == 401) {
        NavigatorUtil.goToLogin();
        return null;
      }
      throw Exception(bodyString);
    }
  }
}
