class Idol {
  final String name;
  final int membersCount;

  Idol(this.name, this.membersCount);

  void sayName() {
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount() {
    print('${this.name} 멤버는 ${this.membersCount}명 입니다.');
  }
}

class GirlGroup extends Idol {
  GirlGroup(super.name, super.membersCount);

  @override
  void sayName() {
    print('저는 여자 아이돌 ${this.name}입니다.');
  }
}
