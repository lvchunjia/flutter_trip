import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_net_storage/data_model.dart';
import 'package:http/http.dart' as http;

class FutureStudy extends StatefulWidget {
  const FutureStudy({super.key});

  @override
  State<FutureStudy> createState() => _FutureStudyState();
}

class _FutureStudyState extends State<FutureStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future与FutureBuilder使用')),
      body: FutureBuilder<DataModel>(
        future: fetchGet(),
        builder: (BuildContext content, AsyncSnapshot<DataModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('state none');
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return const Text('state active');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Text('code:${snapshot.data?.code}'),
                    Text('requestPrams:${snapshot.data?.data?.requestPrams}'),
                  ],
                );
              }
          }
        },
      ),
    );
  }

  Future<DataModel> fetchGet() async {
    var uri =
        Uri.parse('https://api.geekailab.com/uapi/test/test?requestPrams=11');
    var response = await http.get(uri);

    var result = jsonDecode(response.body);
    return DataModel.fromJson(result);
  }
}
