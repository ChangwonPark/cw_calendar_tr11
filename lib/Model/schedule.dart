class Schedule {
  /// 들고 있을값들 먼저 리스트업하고
  /// 그다음 property, 즉 필드를 만들기
  /// 1) 식별 가능한 ID
  final int id;

  /// 2) 시작시간
  final int startTime;

  /// 3) 종료시간
  final int endTime;

  /// 4) 일정내용
  final String content;

  /// 5) 날짜
  final DateTime date;

  /// 6) 카테고리
  final String color;

  /// 7) 일정 생성날짜
  final DateTime createdAt;

  Schedule({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.date,
    required this.color,
    required this.createdAt,
  });
}
