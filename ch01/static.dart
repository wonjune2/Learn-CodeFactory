class Counter {
  static int i = 0;

  Counter() {
    i++;
    print(i);
  }
}

void main(List<String> args) {
  var counter = Counter();
  var counter1 = Counter();
  var counter2 = Counter();
}
