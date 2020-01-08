import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  group('DateTime', () {
    test('can subtract Durations', () {
      expect(
        DateTime(2019, 1, 1, 0, 0, 30) - 30.seconds,
        DateTime(2019, 1, 1, 0, 0, 0),
      );
    });

    test('can add Durations', () {
      expect(
        DateTime(2019, 1, 1, 0, 0, 30) - 30.seconds,
        DateTime(2019, 1, 1, 0, 0, 0),
      );
    });

    test('can iterate over DateTimes', () {
      final start = DateTime(2019);
      final end = start + 2.days;
      final days = start.to(end);
      expect(days.length, 2);
      expect(days.first, start + 1.days);
      expect(days.last, end);
    });

    test('iterating with same dates results in empty iterator', () {
      expect(DateTime(2019).to(DateTime(2019)), isEmpty);
    });

    test('can iterate over DateTimes backwards', () {
      final start = DateTime(2019);
      final end = start - 2.days;
      final days = start.to(end);
      expect(days.length, 2);
      expect(days.first, start - 1.days);
      expect(days.last, end);
    });

    test('can iterate by Duration', () {
      final start = DateTime(2019);
      final end = DateTime(2019) + 1.hours;
      final hours = start.to(end, by: 1.hours);
      expect(hours.single, end);
    });
  });
}
