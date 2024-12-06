import 'package:no_smoking/main.dart';

double calculatePercentage(DateTime start, DateTime end, DateTime current) {
  if (current.isBefore(start)) return 0.0;
  if (current.isAfter(end)) return 100.0;

  // 시작과 종료 시간의 차이를 계산
  int totalDuration = end.difference(start).inMilliseconds;

  logger.i(totalDuration);
  // 시작 시간과 현재 시간의 차이를 계산
  int elapsedDuration = current.difference(start).inMilliseconds;


  // 퍼센트 계산
  return (elapsedDuration / totalDuration) * 100;
}