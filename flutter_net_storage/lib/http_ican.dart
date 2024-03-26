import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpICan extends StatefulWidget {
  const HttpICan({super.key});

  @override
  State<HttpICan> createState() => _HttpIcanState();
}

class _HttpIcanState extends State<HttpICan> {
  String resultShow = '';
  String resultPostShow = '';
  String resultPostJsonShow = '';

  get _doGetBtn =>
      ElevatedButton(onPressed: _doGet, child: const Text('Do Get'));

  get _doPostBtn =>
      ElevatedButton(onPressed: _doPost, child: const Text('Do Post'));

  get _doPostJsonBtn =>
      ElevatedButton(onPressed: _doPostJson, child: const Text('Do Post Json'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HttpICan')),
      body: Column(
        children: [
          _doGetBtn,
          Text('doGet结果$resultShow'),
          _doPostBtn,
          Text('doPost结果$resultPostShow'),
          _doPostJsonBtn,
          Text('doPostJson结果$resultPostJsonShow'),
        ],
      ),
    );
  }

  void _doGet() async {
    var uri =
        Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=ChatGPT');
    var response = await http.get(uri);
    //http请求成功
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

  void _doPost() async {
    var uri = Uri.parse('https://api.devio.org/uapi/test/test');
    //数据格式必须为Map<String, String>
    var params = {"requestPrams": "doPost：ChatGPT"};
    //默认为x-www-form-urlencoded 格式，所以可以不用设置content-type
    var response = await http.post(uri, body: params);
    //http请求成功
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

  void _doPostJson() async {
    var uri = Uri.parse('https://api.devio.org/uapi/test/testJson');
    var params = {"requestPrams": "doPost：ChatGPT"};
    var response = await http.post(
      uri,
      body: jsonEncode(params), //将数据转成json string
      headers: {
        //设置content-type为application/json
        "content-type": "application/json"
      },
    );
    //http请求成功
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var map = jsonDecode(jsonString);
      setState(() {
        resultPostJsonShow = map['msg'];
      });
    } else {
      setState(() {
        resultPostJsonShow =
            "请求失败：code: ${response.statusCode}，body:${response.body}";
      });
    }
  }
}
