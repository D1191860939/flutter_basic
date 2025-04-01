class TimeRecord {
  // 当前时刻
  final Duration record;

  // 与上一次记录的差值
  final Duration addition;

  TimeRecord({
    required this.record,
    required this.addition,
  });
}
