import 'dart:async';

void main(List<String> args) {
  final controller = StreamController();

  final stream = controller.stream.asBroadcastStream();

  final streamListener1 = stream.listen((event) {
    print('listening1');
    print(event);
  });

  final streamListener2 = stream.listen((event) {
    print('listening2');
    print(event);
  });

  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);
}
