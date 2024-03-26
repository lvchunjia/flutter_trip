import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:trip_flutter/dao/header_util.dart';
import 'package:trip_flutter/util/navigator_util.dart';

import '../model/travel_category_model.dart';
import '../model/travel_tab_model.dart';

///旅拍模块Dao
class TravelDao {
  ///获取旅拍类别接口
  static Future<TravelCategoryModel?> getCategory() async {
    var url = Uri.parse('https://api.geekailab.com/uapi/ft/category');
    final response = await http.get(url, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder(); //fix 中文乱码
    String bodyString = utf8decoder.convert(response.bodyBytes);
    debugPrint(bodyString);

    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      return TravelCategoryModel.fromJson(result['data']);
    } else {
      if (response.statusCode == 401) {
        NavigatorUtil.goToLogin();
        return null;
      }
      throw Exception(bodyString);
    }
  }

  ///获取旅拍类别下的数据
  static Future<TravelTabModel?> getTravels(
    String groupChannelCode,
    int pageIndex,
    int pageSize,
  ) async {
    Map<String, String> paramsMap = {};
    paramsMap['pageIndex'] = pageIndex.toString();
    paramsMap['pageSize'] = pageSize.toString();
    paramsMap['groupChannelCode'] = groupChannelCode;
    var uri = Uri.https('api.geekailab.com', '/uapi/ft/travels', paramsMap);
    final response = await http.get(uri, headers: hiHeaders());
    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);
    debugPrint(bodyString);

    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      return TravelTabModel.fromJson(result['data']);
    } else {
      if (response.statusCode == 401) {
        NavigatorUtil.goToLogin();
        return null;
      }
      throw Exception(bodyString);
    }
  }
}
