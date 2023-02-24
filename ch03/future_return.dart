void main(List<String> args) async {
  final result = await addNumbers(1, 1);
  print('결과값 $result');
  final result2 = await addNumbers(2, 2);
  print('결과값 $result2');
}

Future<int> addNumbers(int number1, int number2) async {
  await Future.delayed(Duration(seconds: 1), () {
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');

  return number1 + number2;
}
