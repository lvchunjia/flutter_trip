import 'dart:convert';

import 'package:flutter/material.dart';

import 'data_model.dart';

class JsonParsingPage extends StatefulWidget {
  const JsonParsingPage({super.key});

  @override
  State<JsonParsingPage> createState() => _JsonParsingPageState();
}

class _JsonParsingPageState extends State<JsonParsingPage> {
  var resultShow = '';
  var resultJsonShow = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Json解析与Dart Model')),
      body: Column(
        children: [
          _json2MapBtn(),
          Text('结果：$resultShow'),
          _json2ModelBtn(),
          Text('结果：$resultJsonShow')
        ],
      ),
    );
  }

  _json2MapBtn() {
    return ElevatedButton(onPressed: _json2Map, child: const Text('json2Map'));
  }

  void _json2Map() {
    var jsonString =
        '{"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}';
    Map<String, dynamic> map = jsonDecode(jsonString);
    setState(() {
      resultShow =
          'code：${map['code']};requestPrams:${map['data']['requestPrams']}';
    });
  }

  _json2ModelBtn() {
    return ElevatedButton(onPressed: json2Model, child: const Text('json2Map'));
  }

  void json2Model() {
    var jsonString =
        '{"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}';
    Map<String, dynamic> map = jsonDecode(jsonString); //将json转成Map；
    DataModel model = DataModel.fromJson(map); //将Map转成Dart Model
    setState(() {
      resultJsonShow =
          'code: ${model.code};requestPrams:${model.data?.requestPrams}'; //使用Map中的数据
    });
  }
}
