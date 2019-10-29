import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  group('TimeExtension', () {
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
    });

    group('Duration', () {
      test('has correct days-to-week static value', () {
        expect(DurationTimeExtension.daysPerWeek, 7);
      });

      test('has correct nanosecond-to-microsecond static value', () {
        expect(DurationTimeExtension.nanosecondsPerMicrosecond, 1000);
      });

      test('can be converted to weeks', () {
        expect(7.days.inWeeks, 1);
      });

      test('can be converted into a future DateTime', () {
        expect(7.days.fromNow, _isAbout(DateTime.now() + 7.days));
      });

      test('can be converted into a previous DateTime', () {
        expect(7.days.ago, _isAbout(DateTime.now() - 7.days));
      });
    });
  });
}

// Checks if the two times returned a *just* about equal. Since `fromNow` and
// `ago` use DateTime.now(), we can't create an expected condition that is
// exactly equal.
Matcher _isAbout(DateTime expected) =>
    predicate<DateTime>((dateTime) => dateTime.millisecondsSinceEpoch - expected.millisecondsSinceEpoch < 1);
