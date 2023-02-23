class Cache<D> {
  final D data;

  Cache({required this.data});
}

void main(List<String> args) {
  final cache = Cache<List<int>>(data: [1, 2, 3]);

  cache.data.reduce((value, element) {
    print('value: $value');
    print('element: $element');
    return value + element;
  });
}
