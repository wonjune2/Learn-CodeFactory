class Idol {
  String _name = "블랙핑크";

  String get name {
    return this._name;
  }

  set name(String name) {
    this._name = name;
  }
}

void main(List<String> args) {
  Idol blackPink = Idol();

  print(blackPink.name);
  blackPink.name = "BTS";
  print(blackPink.name);
}
