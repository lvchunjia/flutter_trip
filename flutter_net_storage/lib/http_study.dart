import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudy extends StatefulWidget {
  const HttpStudy({super.key});

  @override
  State<HttpStudy> createState() => _HttpStudyState();
}

class _HttpStudyState extends State<HttpStudy> {
  var resultShow = '';
  var resultPostShow = '';
  var resultPostJsonShow = '';
  var resultPostJsonShow2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('基于Http实现网络操作')),
        body: Column(
          children: [
            _doGetBtn(),
            Text("返回的结果：$resultShow"),
            _doPostBtn(),
            Text("返回的结果：$resultPostShow"),
            _doPostJsonBtn(),
            Text("返回的结果：$resultPostJsonShow"),
            Text("返回的结果：$resultPostJsonShow2")
          ],
        ));
  }

  _doGetBtn() {
    return ElevatedButton(onPressed: _doGet, child: const Text('发送get请求'));
  }

  // 发送GET请求
  void _doGet() async {
    var uri =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      setState(() {
        resultShow = response.body;
      });
    } else {
      setState(() {
        resultShow = "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }

  _doPostBtn() {
    return ElevatedButton(onPressed: _doPost, child: const Text('发送post请求'));
  }

  void _doPost() async {
    var uri =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var params = {"requestParams": "doPost"};
    var response = await http.post(uri, body: params);

    if (response.statusCode == 200) {
      setState(() {
        resultPostShow = response.body;
      });
    } else {
      setState(() {
        resultPostShow =
            "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }

  _doPostJsonBtn() {
    return ElevatedButton(
        onPressed: _doPostJson, child: const Text('发送post请求'));
  }

  void _doPostJson() async {
    var uri =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var params = {"requestParams": "doPost"};
    var response = await http.post(uri,
        body: jsonEncode(params),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 200) {
      setState(() {
        resultPostJsonShow = response.body;
      });
      var map = jsonDecode(response.body);
      setState(() {
        resultPostJsonShow2 = map['msg'];
      });
    } else {
      setState(() {
        resultPostJsonShow =
            "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }
}
