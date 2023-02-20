void main(List<String> args) {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  testFold();
}

List<String> test() {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final newList = blackPinkList.where((name) => name == '제니' || name == '지수');
  print(newList);
  return newList.toList();
}

List<String> testMap() {
  List<String> blackPink = ['리사', '제니', '지수', '로제'];

  final newPink = blackPink.map((e) => '블랙핑크 $e');
  return newPink.toList();
}

void testReduce() {
  List<String> blackPink = ['리사', '제니', '지수', '로제'];

  final newPink = blackPink.reduce((value, element) {
    print(value);

    return value + "," + element;
  });
}

void testFold() {
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final allMembers = blackPinkList.fold<int>(0, (value, element) {
    print(value);
    print(element);
    return value + element.length;
  });
}
