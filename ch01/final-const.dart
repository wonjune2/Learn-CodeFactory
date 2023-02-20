void main(List<String> args) {
  // final 런타임 상수
  final String name = '블랙핑크';
  // 빌드 타임 상수
  const String name2 = 'BTS';

  // final, const 차이점
  final DateTime now = DateTime.now();
  //const DateTime now2 = DateTime.now(); // const는 빌드 타임 상수이기 때문에 빌드시 값을 알아야 하는데
  //DateTime now 는 런타임시 날짜를 알려 줌으로서 에러를 반환
}
