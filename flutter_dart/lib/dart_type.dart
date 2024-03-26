import 'package:flutter_dart/oop_learn.dart';

void main() {
  // _numType();
  // _stringType();
  // _boolType();
  // _listType();
  // _mapType();
  // _tips();

  Student student = Student('985', 'Jack', 26);
  student.school = '211';
  print('school: ${student.school}');
}

// 数字类型
_numType() {
  // num是数字类型的父类型，有两个子类 int  double
  num num1 = -1.0;
  num num2 = 2;

  int int1 = 3; // 只能是整数
  double d1 = 1.0; // 双精度的浮点数

  print("num: $num1; num: $num2; int: $int1; double: $d1");

  print(num1.abs()); // 绝对值
  print(num1.toInt()); // 转成整数
  print(num1.toDouble()); // 转成浮点数
}

// 字符串
_stringType() {
  String str1 = '字符串', str2 = '单引号';

  String str3 = 'str1: $str1; str2:$str2';
  String str5 = '常用数据类型，请看控制台';
  print(str3);

  print(str5.substring(1, 5));
  print(str5.indexOf('类型'));
}

// 布尔类型
_boolType() {
  bool success = true, fail = false;

  print(success);
  print(fail);
  print(success || fail);
  print(success && fail);
}

// 集合 List
_listType() {
  List list = [1, 2, 3, '集合'];
  print(list);

  List<int> intList = [1, 2, 3];

  List<String> list1 = [];
  list1.add('list3');
  list1.addAll(['1', '2']);
  print(list1);

  List list4 = List.generate(3, (index) => index + 2);
  print(list4);

  for (int i = 0; i < list.length; i++) {
    print(list[i]);
  }
  for (var o in list) {
    print(o);
  }
  list.forEach((element) {
    print(element);
  });
}

_mapType() {
  Map names = {'xiaoming': '晓明'};
  print(names);

  Map ages = {};
  ages['xiaoming'] = 16;
  ages['xiaohong'] = 18;
  print(ages);

  ages.forEach((key, value) {
    print('$key: $value');
  });
  Map ages2 = ages.map((key, value) {
    return MapEntry(key, value + 1);
  });
  print(ages2);

  for (var key in ages.keys) {
    print('key: $key value: ${ages[key]}');
  }

  Map<String, int> ages3 = {};
  ages3['xiaoming'] = 16;
  ages3['xiaohong'] = 18;
  print(ages3);
  print(ages3.keys);
  print(ages3.values);
  print(ages3.isEmpty);
  print(ages3.isNotEmpty);
  print(ages3.length);
  print(ages3.containsKey('xiaoming'));
  print(ages3.containsValue(16));
  print(ages3.remove('xiaoming'));
  print(ages3);
}

_tips() {
  dynamic x = 'hal'; // string
  // 关闭了类型检查，但是运行时报错
  // x.foo();
  x = 123; // int

  var a = 'hal';
  // a = 123; // 报错
  print(a.runtimeType);

  Object o = 'hal';
  o.toString();
  // o.foo(); //报错
}
