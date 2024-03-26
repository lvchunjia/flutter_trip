import 'package:trip_flutter/dao/login_dao.dart';

hiHeaders() {
  Map<String, String> header = {
    "auth-token": "ZmEtMjAyMS0wNC0xMaiAyMToyddMjoyMC1mYQ==ft",
    "course-flag": 'ft',
    "boarding-pass": LoginDao.getBoardingPass() ?? "",
  };
  return header;
}
