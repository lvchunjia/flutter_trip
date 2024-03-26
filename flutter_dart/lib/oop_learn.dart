void main() {
  Person person = Person('Jack', 19);
  print(person.toString());

  Student student = Student('情话', 'tom', 26);
  student._school = '985';
  print(student.toString());

  Student stu1 = Student.cover(student, '211');
  print('student1: ${stu1.toString()}');

  Student stu2 = Student.stu(student);
  print('stu2: ${stu2.toString()}');

  Logger log1 = Logger();
  Logger log2 = Logger();
  print('log1==log2：${log1 == log2}');

  StudyFlutter studyFlutter = StudyFlutter();
  studyFlutter.study();
  StudyDart studyDart = StudyDart();
  studyDart.study2();

  Test test = Test('Jack', 22);
  test.study2();
}

class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name, age: $age';
  }
}

class Student extends Person {
  String? _school;
  String? city;
  String? country;
  String? funName;

  String? get school => _school;
  set school(String? school) {
    _school = school;
  }

  Student(this._school, String? name, int? age,
      {this.city, this.country = 'china'})
      : funName = '$country.$city',
        super(name, age) {}

  Student.cover(Student stu, this._school) : super(stu.name, stu.age) {
    print('命名构造方法');
  }

  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age, city: stu.city);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'name:$name, school:$_school, city:$city, ${super.toString()}';
  }
}

class StudyFlutter extends Study {
  @override
  void study() {
    print('Learning Flutter');
  }
}

class StudyDart implements Study {
  @override
  void study() {
    // TODO: implement study
  }

  @override
  void study2() {
    print('StudyDart');
  }
}

abstract class Study {
  void study();
  void study2() {
    print('study2');
  }
}

class Logger {
  static Logger? _cache;

  factory Logger() {
    _cache ??= Logger._internal();
    return _cache!;
  }

  Logger._internal();

  void log(Student msg) => print(msg);
}

mixin StudyMixin {
  void study();
  void study2() {
    print('StudyMixin');
  }
}

class Test extends Person with StudyMixin {
  Test(super.name, super.age);

  @override
  void study() {
    study2();
  }
}
