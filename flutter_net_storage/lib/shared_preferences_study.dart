import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPCounterWidget extends StatefulWidget {
  const SPCounterWidget({super.key});

  @override
  State<SPCounterWidget> createState() => _SPCounterWidgetState();
}

class _SPCounterWidgetState extends State<SPCounterWidget> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('基于shared_preferences实现计数器')),
      body: Column(
        children: <Widget>[
          Row(
            children: [
              ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text('Increment Counter')),
              ElevatedButton(
                  onPressed: _getCounter, child: const Text('Get Counter')),
            ],
          ),
          buildText(),
          Text(
            'result：$localCount',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Text buildText() =>
      Text('result：$countString', style: const TextStyle(fontSize: 20));

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = "$countString 1";
    });
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  void _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }
}
