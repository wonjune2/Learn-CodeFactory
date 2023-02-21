void main(List<String> args) {
  List<int> numbers = [1, 2, 3, 4, 5];

  // final allMembers = numbers.reduce((value, element) {
  //   return value + element;
  // });

  // print(allMembers);

  final allmembers = numbers.reduce((value, element) => value + element);
  print(allmembers);
}
