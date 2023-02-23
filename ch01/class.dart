class Idol {
  final String name;
  final int membersCount;

  Idol({required this.name, required this.membersCount});

  Idol.fromMap(Map<String, dynamic> map)
      : this.name = map['name'],
        this.membersCount = map['membersCount'];

  void sayHello() {
    print('저는 ${this.name} 입니다. 멤버는 ${this.membersCount}명 있습니다.');
  }
}

void main(List<String> args) {
  Idol blackPink = Idol(name: "블랙핑크", membersCount: 4);
  blackPink.sayHello();

  Idol bts = Idol.fromMap({
    'name': 'BTS',
    'membersCount': 7,
  });
  bts.sayHello();
}
