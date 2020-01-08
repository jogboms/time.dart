import 'package:time/time.dart';

void main() {
  print(DateTime.now() + 7.days);
  print(DateTime.now() - 7.days);

  DateTime.now().to(1.weeks.fromNow, by: 1.days).forEach(print);
}
