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

      test('can get only year, month and day', () {
        expect(
          /// Returns only year, month and day
          DateTime(2020, 4, 10, 15, 27, 30).date,
          DateTime(2020, 4, 10, 0, 0, 0),
        );
      });

      test('can get only the time', () {
        expect(
          /// Returns the time
          DateTime(2020, 4, 10, 15, 27, 30).timeOfDay,
          Duration(hours: 15, minutes: 27, seconds: 30),
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

      group('can handle calculateAge', () {
        test('normal pattern 1', () {
          // October 10, 2011 is Dart's birthday.
          final birthday = DateTime(2011, 10, 10, 0, 0, 0, 0, 0);
          final expected = birthday.calculateAge();
          expect(expected, 8);
        });

        test('normal pattern 2', () {
          final birthday = DateTime(2011, 10, 10, 23, 59, 59, 999, 999);
          final expected = birthday.calculateAge();
          expect(expected, 8);
        });

        test('East Asian Age Reckoning pattern 1', () {
          final birthday = DateTime(2011, 10, 10, 0, 0, 0, 0, 0);
          final expected = birthday.calculateAge(isEastAsianAgeReckoning: true);
          expect(expected, 10);
        });

        test('East Asian Age Reckoning pattern 2', () {
          final birthday = DateTime(2011, 10, 10, 23, 59, 59, 999, 999);
          final expected = birthday.calculateAge(isEastAsianAgeReckoning: true);
          expect(expected, 10);
        });
      });

      group('can handle copyWith', () {
        test('without null values', () {
          final initial = DateTime(2019, 2, 4, 24, 50, 45, 1, 1);
          final expected = initial.copyWith(
            year: 2021,
            month: 10,
            day: 28,
            hour: 12,
            minute: 45,
            second: 10,
            millisecond: 0,
            microsecond: 12,
          );
          expect(expected.year, 2021);
          expect(expected.month, 10);
          expect(expected.day, 28);
          expect(expected.hour, 12);
          expect(expected.minute, 45);
          expect(expected.second, 10);
          expect(expected.millisecond, 0);
          expect(expected.microsecond, 12);
        });
      });

      test('with null values', () {
        final initial = DateTime(2019, 2, 4, 24, 50, 45, 1, 1);
        final year = initial.copyWith(year: 2021);
        expect(year.year, 2021);
        final month = initial.copyWith(month: 10);
        expect(month.month, 10);
        final day = initial.copyWith(day: 28);
        expect(day.day, 28);
        final hour = initial.copyWith(hour: 12);
        expect(hour.hour, 12);
        final minute = initial.copyWith(minute: 45);
        expect(minute.minute, 45);
        final second = initial.copyWith(second: 10);
        expect(second.second, 10);
        final millisecond = initial.copyWith(millisecond: 0);
        expect(millisecond.millisecond, 0);
        final microsecond = initial.copyWith(microsecond: 12);
        expect(microsecond.microsecond, 12);
      });
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

    test('can still use later until 2.0.0', () {
      expect(7.days.later, _isAbout(DateTime.now() + 7.days));
    });

    test('can be converted into a previous DateTime', () {
      expect(7.days.ago, _isAbout(DateTime.now() - 7.days));
    });

    test('Can be used to pause the program flow', () async {
      final timeToWait = Duration(seconds: 2);
      final before = DateTime.now();
      await timeToWait.delay;
      final after = DateTime.now();
      final extraTime = after.millisecondsSinceEpoch - before.add(timeToWait).millisecondsSinceEpoch;
      expect(extraTime >= 0, true);
    });
  });
}

// Checks if the two times returned a *just* about equal. Since `fromNow` and
// `ago` use DateTime.now(), we can't create an expected condition that is
// exactly equal.
Matcher _isAbout(DateTime expected) =>
    predicate<DateTime>((dateTime) => dateTime.millisecondsSinceEpoch - expected.millisecondsSinceEpoch < 1);
