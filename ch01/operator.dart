void main(List<String> args) {
  double? number;

  number ??= 3; // ??를 사용하면 기존 값이 null일 때만 저장됩니다.
  print(number);

  number ??= 4; // 기존값이 null이 아니므로 3이 유지됩니다.
  print(number);
  isOperator();
}

void isOperator() {
  int number1 = 1;

  print(number1 is int);
  print(number1 is String);
  print(number1 is! int);
  print(number1 is! String);
}

void andOr() {
  bool result = 12 > 10 && 1 > 0;
  print(result);

  bool result2 = 12 > 10 && 0 > 1;
  print(result2);

  bool result3 = 12 > 10 || 1 > 0;
  print(result3);

  bool result4 = 12 > 10 || 0 > 1;
  print(result4);

  bool result5 = 12 < 10 && 1 < 0;
  print(result5);
}
