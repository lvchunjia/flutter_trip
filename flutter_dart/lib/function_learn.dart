void main() {
  sum(1, 2, isPrint: true);

  FunctionLearn functionLearn = FunctionLearn();
  functionLearn.sum(2, 2, isPrint: true);
  functionLearn.anonymousFunction();
  var result = FunctionLearn.doSum(2, 3);
  print('result: $result');
}

// 方法的构成
// 返回值类型 + 方法名 + 参数
int sum(int val1, int val2, {bool? isPrint = false}) {
  var result = val1 + val2;

  if (isPrint ?? false) {
    print('result:$result');
  }
  return result;
}

class FunctionLearn {
  int sum(int val1, int val2, {bool? isPrint = false}) {
    var result = val1 + val2;

    if (isPrint ?? false) {
      print('result:$result');
    }
    return result;
  }

  // 私有方法
  // 作用域：当前类
  _learn() {
    print('_learn私有方法');
  }

  // 匿名方法
  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((element) {
      print('element: $element');
    });
  }

  static doSum(int v1, int v2) {
    return v1 + v2;
  }
}
