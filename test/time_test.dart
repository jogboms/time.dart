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

      test('can handle isToday', () {
        final today = DateTime.now();
        final yesterday = DateTime.now().subtract(Duration(days: 1));
        final tomorrow = DateTime.now().add(Duration(days: 1));
        expect(today.isToday, true);
        expect(yesterday.isToday, false);
        expect(tomorrow.isToday, false);
      });

      test('can handle isTomorrow', () {
        final today = DateTime.now();
        final yesterday = DateTime.now().subtract(Duration(days: 1));
        final tomorrow = DateTime.now().add(Duration(days: 1));
        expect(today.isTomorrow, false);
        expect(yesterday.isTomorrow, false);
        expect(tomorrow.isTomorrow, true);
      });

      test('can handle wasYesterday', () {
        final today = DateTime.now();
        final yesterday = DateTime.now().subtract(Duration(days: 1));
        final tomorrow = DateTime.now().add(Duration(days: 1));
        expect(today.wasYesterday, false);
        expect(yesterday.wasYesterday, true);
        expect(tomorrow.wasYesterday, false);
      });

      test('can handle isLeapYear', () {
        expect(DateTime(2020, 10, 10).isLeapYear, true);
        expect(DateTime(2019, 10, 10).isLeapYear, false);
        expect(DateTime(2100, 01, 01).isLeapYear, false);
        expect(DateTime(2000, 01, 01).isLeapYear, true);
        expect(DateTime(1000, 01, 01).isLeapYear, false);
        expect(DateTime(1584, 01, 01).isLeapYear, true);
      });

      test('can handle daysInMonth', () {
        // Leap year.
        expect(DateTime(2020, 01, 01).daysInMonth, 31);
        expect(DateTime(2020, 02, 01).daysInMonth, 29);
        expect(DateTime(2020, 03, 01).daysInMonth, 31);
        expect(DateTime(2020, 04, 01).daysInMonth, 30);
        expect(DateTime(2020, 05, 01).daysInMonth, 31);
        expect(DateTime(2020, 06, 01).daysInMonth, 30);
        expect(DateTime(2020, 07, 01).daysInMonth, 31);
        expect(DateTime(2020, 08, 01).daysInMonth, 31);
        expect(DateTime(2020, 09, 01).daysInMonth, 30);
        expect(DateTime(2020, 10, 01).daysInMonth, 31);
        expect(DateTime(2020, 11, 01).daysInMonth, 30);
        expect(DateTime(2020, 12, 01).daysInMonth, 31);

        // Non-leap year.
        expect(DateTime(2019, 01, 01).daysInMonth, 31);
        expect(DateTime(2019, 02, 01).daysInMonth, 28);
        expect(DateTime(2019, 03, 01).daysInMonth, 31);
        expect(DateTime(2019, 04, 01).daysInMonth, 30);
        expect(DateTime(2019, 05, 01).daysInMonth, 31);
        expect(DateTime(2019, 06, 01).daysInMonth, 30);
        expect(DateTime(2019, 07, 01).daysInMonth, 31);
        expect(DateTime(2019, 08, 01).daysInMonth, 31);
        expect(DateTime(2019, 09, 01).daysInMonth, 30);
        expect(DateTime(2019, 10, 01).daysInMonth, 31);
        expect(DateTime(2019, 11, 01).daysInMonth, 30);
        expect(DateTime(2019, 12, 01).daysInMonth, 31);
      });

      test('can handle isAtSameYearAs', () {
        expect(
          DateTime(2020, 10, 10).isAtSameYearAs(DateTime(2020, 09, 12)),
          true,
        );
        expect(
          DateTime(2019, 10, 10).isAtSameYearAs(DateTime(2020, 10, 10)),
          false,
        );
      });

      test('can handle isAtSameMonthAs', () {
        expect(
          DateTime(2020, 10, 18).isAtSameMonthAs(DateTime(2020, 10, 12)),
          true,
        );
        expect(
          DateTime(2020, 09, 10).isAtSameMonthAs(DateTime(2020, 10, 10)),
          false,
        );
        expect(
          DateTime(2019, 10, 10).isAtSameMonthAs(DateTime(2020, 10, 10)),
          false,
        );
      });

      test('can handle isAtSameDayAs', () {
        expect(
          DateTime(2020, 10, 06, 12).isAtSameDayAs(DateTime(2020, 10, 06, 15)),
          true,
        );
        expect(
          DateTime(2020, 10, 08, 15).isAtSameDayAs(DateTime(2020, 10, 06, 15)),
          false,
        );
        expect(
          DateTime(2020, 12, 06, 15).isAtSameDayAs(DateTime(2020, 10, 06, 15)),
          false,
        );
        expect(
          DateTime(2021, 12, 06, 15).isAtSameDayAs(DateTime(2020, 10, 06, 15)),
          false,
        );
      });

      test('can handle isAtSameHourAs', () {
        expect(
          DateTime(2020, 10, 06, 12, 15).isAtSameHourAs(
            DateTime(2020, 10, 06, 12, 25),
          ),
          true,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15).isAtSameHourAs(
            DateTime(2020, 10, 06, 15, 15),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15).isAtSameHourAs(
            DateTime(2020, 10, 07, 12, 15),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15).isAtSameHourAs(
            DateTime(2020, 11, 06, 12, 15),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15).isAtSameHourAs(
            DateTime(2021, 10, 06, 12, 15),
          ),
          false,
        );
      });

      test('can handle isAtSameMinuteAs', () {
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2020, 10, 06, 12, 15, 40),
          ),
          true,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2020, 10, 06, 12, 17, 30),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2020, 10, 06, 15, 15, 30),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2020, 10, 09, 12, 15, 30),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2020, 12, 06, 12, 15, 30),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30).isAtSameMinuteAs(
            DateTime(2022, 10, 06, 12, 15, 30),
          ),
          false,
        );
      });

      test('can handle isAtSameSecondAs', () {
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 150),
          ),
          true,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 10, 06, 12, 15, 45, 100),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 10, 06, 12, 25, 30, 100),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 10, 06, 17, 15, 30, 100),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 10, 02, 12, 15, 30, 100),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2020, 06, 06, 12, 15, 30, 100),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 100).isAtSameSecondAs(
            DateTime(2016, 10, 06, 12, 15, 30, 100),
          ),
          false,
        );
      });

      test('can handle isAtSameMillisecondAs', () {
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 150, 750),
          ),
          true,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 175, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 06, 12, 15, 32, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 06, 12, 18, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 06, 18, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 10, 09, 12, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(2020, 04, 06, 12, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMillisecondAs(
            DateTime(1948, 10, 06, 12, 15, 30, 150, 600),
          ),
          false,
        );
      });

      test('can handle isAtSameMicrosecondAs', () {
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 150, 600),
          ),
          true,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 150, 900),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 12, 15, 30, 160, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 12, 15, 34, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 12, 12, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 06, 07, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 10, 09, 12, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2020, 06, 06, 12, 15, 30, 150, 600),
          ),
          false,
        );
        expect(
          DateTime(2020, 10, 06, 12, 15, 30, 150, 600).isAtSameMicrosecondAs(
            DateTime(2030, 10, 06, 12, 15, 30, 150, 600),
          ),
          false,
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
