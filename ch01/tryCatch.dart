void main(List<String> args) {
  error();
}

void error() {
  try {
    final String name = "이원준";

    throw Exception("이름이 잘못됐습니다. $name");

    print(name);
  } catch (e) {
    print(e);
  }
}
