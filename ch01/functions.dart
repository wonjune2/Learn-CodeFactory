int addTwoNumbers(int a, [int b = 2]) {
  return a + b;
}

int namedAddTwoNumbers({
  required int a,
  int b = 2,
}) {
  return a + b;
}

void main(List<String> args) {
  print(addTwoNumbers(1));
  print(namedAddTwoNumbers(a: 1));
}
