import 'package:flutter_dart/oop_learn.dart';

void main() {
  Cache<String> cache1 = Cache();
  cache1.setItem('cach1', 'cach1');
  String? str1 = cache1.getItem('cach1');

  Cache<int> cache2 = Cache();
  cache2.setItem('cach2', 1);
  int? int1 = cache2.getItem('cach2');

  print('cach1:$str1, cach2:$int1');

  Member<Student> member = Member(Student('985', 'Jack', 21));
  member.fixedName();
}

class Cache<T> {
  final Map<String, T> _cached = {};

  void setItem(String key, T value) {
    _cached[key] = value;
  }

  T? getItem(String key) {
    return _cached[key];
  }
}

class Member<T extends Person> {
  final T _person;
  Member(this._person);
  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
