import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  group('Integers', () {
    test('can be converted into weeks', () {
      expect(1.weeks, Duration(days: 7));
    });

    test('can be converted into days', () {
      expect(5.days, Duration(days: 5));
    });

    test('can be converted into hours', () {
      expect(22.hours, Duration(hours: 22));
    });

    test('can be converted into minutes', () {
      expect(45.minutes, Duration(minutes: 45));
    });

    test('can be converted into seconds', () {
      expect(30.seconds, Duration(seconds: 30));
    });

    test('can be converted into milliseconds', () {
      expect(15.milliseconds, Duration(milliseconds: 15));
    });

    test('can be converted into microseconds', () {
      expect(10.microseconds, Duration(microseconds: 10));
    });

    test('can be converted into nanoseconds', () {
      expect(5.nanoseconds, Duration(microseconds: 5 ~/ 1000));
    });
  });

  group('Double', () {
    test('can be converted into weeks', () {
      expect(1.5.weeks, Duration(days: 10, hours: 12));
    });

    test('can be converted into days', () {
      expect(5.5.days, Duration(days: 5, hours: 12));
    });

    test('can be converted into hours', () {
      expect(22.5.hours, Duration(hours: 22, minutes: 30));
    });

    test('can be converted into minutes', () {
      expect(45.5.minutes, Duration(minutes: 45, seconds: 30));
    });

    test('can be converted into seconds', () {
      expect(30.5.seconds, Duration(seconds: 30, milliseconds: 500));
    });

    test('can be converted into milliseconds', () {
      expect(15.5.milliseconds, Duration(milliseconds: 15, microseconds: 500));
    });

    test('can be converted into microseconds', () {
      expect(10.5.microseconds, Duration(microseconds: 10));
    });

    test('can be converted into nanoseconds', () {
      expect(5.5.nanoseconds, Duration(microseconds: 5 ~/ 1000));
    });
  });
}
