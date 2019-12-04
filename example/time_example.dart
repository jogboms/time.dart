import 'package:time/time.dart';

void main() {
  // Num Extensions
  print(1.weeks);
  print(1.5.weeks);
  print(7.days);
  print(7.5.days);
  print(22.hours);
  print(22.5.hours);
  print(45.minutes);
  print(45.5.minutes);
  print(30.seconds);
  print(30.5.seconds);
  print(15.milliseconds);
  print(15.5.milliseconds);
  print(10.microseconds);
  print(10.5.microseconds);
  print(5.nanoseconds);
  print(5.5.nanoseconds);

  // DateTime Extensions
  print(DateTime.now() + 7.days);
  print(DateTime.now() - 7.days);

  // Duration Extensions
  print(7.days.inWeeks);
  print(7.days.fromNow);
  print(7.days.ago);

  DateTime.now().to(1.weeks.fromNow, by: 1.days).forEach(print);
}
