import 'oop_learn.dart';

void main() {
  flutterSkills(Person('name', 23));
}

void flutterSkills(Person? person) {
  List? list;
  bool? isOpen;

  print(list?.length);
  if (person != null) {
    print(person.name);
  }

  print(isOpen ?? false);

  list = [];
  list.add(0);
  list.add('');
  list.add(null);
  if (list[0] == null || list[0] == '' || list[0] == 0) {}
  if ([null, '', 0].contains(list[0])) {}
}
