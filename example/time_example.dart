import 'package:time/time.dart';

void main() {
  // Integer Extensions
  print(1.weeks);
  print(7.days);
  print(22.hours);
  print(45.minutes);
  print(30.seconds);
  print(15.milliseconds);
  print(10.microseconds);
  print(5.nanoseconds);

  // DateTime Extensions
  print(DateTime.now() + 7.days);
  print(DateTime.now() - 7.days);

  // Duration Extensions
  print(7.days.inWeeks);
  print(7.days.fromNow);
  print(7.days.ago);
}
