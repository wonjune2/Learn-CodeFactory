enum Status {
  approved,
  pending,
  rejected,
  test,
}

void main(List<String> args) {
  Status status = Status.test;

  switch (status) {
    case Status.approved:
      print("승인 상태입니다.");
      break;
    case Status.pending:
      print('대기 상태입니다.');
      break;
    case Status.rejected:
      print("거절 했습니다.");
      break;
    default:
      print("알 수 없음");
  }
}
