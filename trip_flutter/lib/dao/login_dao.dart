import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trip_flutter/dao/cache_util.dart';
import 'package:trip_flutter/util/navigator_util.dart';

import 'header_util.dart';

class LoginDao {
  static const boardingPas = 'boarding_pass';

  static login({required String userName, required String password}) async {
    Map<String, String> paramsMap = {};
    paramsMap['userName'] = userName;
    paramsMap['password'] = password;

    var uri = Uri.http('api.geekailab.com', '/uapi/user/login', paramsMap);
    final response = await http.post(uri, headers: hiHeaders());

    Utf8Decoder utf8decoder = const Utf8Decoder();
    String bodyString = utf8decoder.convert(response.bodyBytes);

    if (response.statusCode == 200) {
      var result = json.decode(bodyString);
      if (result['code'] == 0 && result['data'] != null) {
        // 保存登录令牌
        _saveBoardingPass(result['data']);
      } else {
        throw Exception(bodyString);
      }
    } else {
      throw Exception(bodyString);
    }
  }

  static void _saveBoardingPass(result) {
    HiCache.getInstance().setString(boardingPas, result);
  }

  static getBoardingPass() {
    return HiCache.getInstance().get(boardingPas);
  }

  static void logOut() {
    HiCache.getInstance().remove(boardingPas);
    NavigatorUtil.goToLogin();
  }
}
