import 'package:clock/clock.dart';
import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
  final date = DateTime(2000, 1, 1);

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

      group('can get only year, month and day', () {
        test('when is not utc', () {
          expect(
            DateTime(2020, 4, 10, 15, 27, 30).date,
            DateTime(2020, 4, 10, 0, 0, 0),
          );
        });

        test('when is utc', () {
          expect(
            DateTime.utc(2020, 4, 10, 15, 27, 30).date,
            DateTime.utc(2020, 4, 10, 0, 0, 0),
          );
        });
      });

      test('can get only the time', () {
        expect(
          /// Returns the time
          DateTime(2020, 4, 10, 15, 27, 30).timeOfDay,
          Duration(hours: 15, minutes: 27, seconds: 30),
        );
      });

      test('can handle isToday', () {
        final today = date;
        withClock(Clock.fixed(today), () {
          final yesterday = today.subtract(Duration(days: 1));
          final tomorrow = today.add(Duration(days: 1));
          expect(today.isToday, true);
          expect(yesterday.isToday, false);
          expect(tomorrow.isToday, false);
        });
      });

      test('can handle isTomorrow', () {
        final today = date;
        withClock(Clock.fixed(today), () {
          final yesterday = today.subtract(Duration(days: 1));
          final tomorrow = today.add(Duration(days: 1));
          expect(today.isTomorrow, false);
          expect(yesterday.isTomorrow, false);
          expect(tomorrow.isTomorrow, true);
        });
      });

      test('can handle wasYesterday', () {
        final today = date;
        withClock(Clock.fixed(today), () {
          final yesterday = today.subtract(Duration(days: 1));
          final tomorrow = today.add(Duration(days: 1));
          expect(today.wasYesterday, false);
          expect(yesterday.wasYesterday, true);
          expect(tomorrow.wasYesterday, false);
        });
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

        test('copyWith should save isUtc', () async {
          final now = DateTime.now().toUtc();
          expect(now.isUtc, isTrue);

          final later = now.copyWith(hour: now.hour + 3);
          expect(later.isUtc, isTrue);
        });
      });

      group('can get first/last days', () {
        test('first day of week', () {
          final initial = DateTime(2022, 5, 20);
          final expected = DateTime(2022, 5, 16);
          expect(initial.firstDayOfWeek, expected);
        });

        test('last day of week', () {
          final initial = DateTime(2022, 5, 20);
          final expected = DateTime(2022, 5, 22);
          expect(initial.lastDayOfWeek, expected);
        });

        test('first day of month', () {
          final initial = DateTime(2022, 5, 20);
          final expected = DateTime(2022, 5, 1);
          expect(initial.firstDayOfMonth, expected);
        });

        group('last day of month', () {
          test('last day of month', () {
            final initial = DateTime(2022, 5, 20);
            final expected = DateTime(2022, 5, 31);
            expect(initial.lastDayOfMonth, expected);
          });
          test('february not leap year', () {
            final initial = DateTime(2022, 2, 20);
            final expected = DateTime(2022, 2, 28);
            expect(initial.lastDayOfMonth, expected);
          });

          test('february leap year', () {
            final initial = DateTime(2020, 2, 20);
            final expected = DateTime(2020, 2, 29);
            expect(initial.lastDayOfMonth, expected);
          });
        });

        test('first day of year', () {
          final initial = DateTime(2022, 5, 20);
          final expected = DateTime(2022, 1, 1);
          expect(initial.firstDayOfYear, expected);
        });

        test('last day of year', () {
          final initial = DateTime(2022, 5, 20);
          final expected = DateTime(2022, 12, 31);
          expect(initial.lastDayOfYear, expected);
        });
      });
    });

    group('clamp', () {
      group('returns max when before it', () {
        final it = DateTime(2022, DateTime.october, 15);
        final min = DateTime(2022, DateTime.september, 1);
        final max = DateTime(2022, DateTime.september, 30);

        test('when it has a value for min', () {
          expect(it.clamp(min: min, max: max), equals(max));
        });

        test('when it does not have a value for min', () {
          expect(it.clamp(max: max), equals(max));
        });
      });

      group('returns min when after it', () {
        final it = DateTime(2022, DateTime.august, 21);
        final min = DateTime(2022, DateTime.september, 15);
        final max = DateTime(2022, DateTime.september, 30);

        test('when it has a value for max', () {
          expect(it.clamp(min: min, max: max), equals(min));
        });

        test('when it does not have a value for max', () {
          expect(it.clamp(min: min), equals(min));
        });
      });

      group('returns it', () {
        final it = DateTime(2022, DateTime.september, 1);
        final min = DateTime(2022, DateTime.august, 1);
        final max = DateTime(2022, DateTime.september, 30);

        test('when both min and max are null', () {
          expect(it.clamp(), equals(it));
        });

        test('when is longer than min and max is null', () {
          expect(it.clamp(min: min), equals(it));
        });

        test('when is shorter than max and min is null', () {
          expect(it.clamp(max: max), equals(it));
        });

        test('when is longer than min and shorter than max', () {
          expect(it.clamp(min: min, max: max), equals(it));
        });
      });

      test('asserts that min should be before max', () {
        final it = DateTime(2022, DateTime.september, 1);
        final min = DateTime(2022, DateTime.september, 30);
        final max = DateTime(2022, DateTime.august, 1);
        expect(
          () => it.clamp(min: min, max: max),
          throwsA(isA<AssertionError>()),
        );
      });

      test('returns min/max if are equal', () {
        final it = DateTime(2022, DateTime.september, 1);
        final min = DateTime(2022, DateTime.september, 30);
        final max = min;
        expect(it.clamp(min: min, max: max), min);
      });
    });
    group('Weekend', () {
      test('monday is not weekend', () {
        final it = DateTime(2022, DateTime.august, 1);
        expect(it.isWeekend, isFalse);
      });
      test('tuesday is not weekend', () {
        final it = DateTime(2022, DateTime.august, 2);
        expect(it.isWeekend, isFalse);
      });
      test('wednesday is not weekend', () {
        final it = DateTime(2022, DateTime.august, 3);
        expect(it.isWeekend, isFalse);
      });
      test('thursday is not weekend', () {
        final it = DateTime(2022, DateTime.august, 4);
        expect(it.isWeekend, isFalse);
      });
      test('friday is not weekend', () {
        final it = DateTime(2022, DateTime.august, 5);
        expect(it.isWeekend, isFalse);
      });
      test('saturday is weekend', () {
        final it = DateTime(2022, DateTime.august, 6);
        expect(it.isWeekend, isTrue);
      });
      test('sunday is weekend', () {
        final it = DateTime(2022, DateTime.august, 7);
        expect(it.isWeekend, isTrue);
      });
    });
    group('Workday', () {
      test('monday is workday', () {
        final it = DateTime(2022, DateTime.august, 1);
        expect(it.isWorkday, isTrue);
      });
      test('tuesday is workday', () {
        final it = DateTime(2022, DateTime.august, 2);
        expect(it.isWorkday, isTrue);
      });
      test('wednesday is workday', () {
        final it = DateTime(2022, DateTime.august, 3);
        expect(it.isWorkday, isTrue);
      });
      test('thursday is workday', () {
        final it = DateTime(2022, DateTime.august, 4);
        expect(it.isWorkday, isTrue);
      });
      test('friday is workday', () {
        final it = DateTime(2022, DateTime.august, 5);
        expect(it.isWorkday, isTrue);
      });
      test('saturday is not workday', () {
        final it = DateTime(2022, DateTime.august, 6);
        expect(it.isWorkday, isFalse);
      });
      test('sunday is not workday', () {
        final it = DateTime(2022, DateTime.august, 7);
        expect(it.isWorkday, isFalse);
      });
    });
    group('EndOfDay', () {
      test('returns the last microsecond of the day', () {
        final it = DateTime(2022, DateTime.august, 1, 12, 30, 15, 10, 5);
        final expected = DateTime(2022, DateTime.august, 1, 23, 59, 59, 999, 999);
        expect(it.endOfDay, expected);
      });
      test('returns the last microsecond of the day for utc', () {
        final it = DateTime.utc(2022, DateTime.august, 1, 12, 30, 15, 10, 5);
        final expected = DateTime.utc(2022, DateTime.august, 1, 23, 59, 59, 999, 999);
        expect(it.endOfDay, expected);
      });
    });
    group('Shift', () {
      group('empty parameters', () {
        test('local', () {
          final it = DateTime(2024, DateTime.january, 3, 2, 24, 12, 123, 456);
          expect(it.shift(), it);
        });
        test('utc', () {
          final it = DateTime.utc(2024, DateTime.january, 3, 2, 24, 12, 123, 456);
          expect(it.shift(), it);
        });
      });
      group('adding parameters', () {
        final it = DateTime(2000, 1, 1, 1, 1, 1, 1, 1);
        test('can shift years', () {
          expect(it.shift(years: 1), DateTime(2001, 1, 1, 1, 1, 1, 1, 1));
        });
        test('can shift months', () {
          expect(it.shift(months: 1), DateTime(2000, 2, 1, 1, 1, 1, 1, 1));
        });
        test('can shift days', () {
          expect(it.shift(days: 1), DateTime(2000, 1, 2, 1, 1, 1, 1, 1));
        });
        test('can shift hours', () {
          expect(it.shift(hours: 1), DateTime(2000, 1, 1, 2, 1, 1, 1, 1));
        });
        test('can shift minutes', () {
          expect(it.shift(minutes: 1), DateTime(2000, 1, 1, 1, 2, 1, 1, 1));
        });
        test('can shift seconds', () {
          expect(it.shift(seconds: 1), DateTime(2000, 1, 1, 1, 1, 2, 1, 1));
        });
        test('can shift milliseconds', () {
          expect(it.shift(milliseconds: 1), DateTime(2000, 1, 1, 1, 1, 1, 2, 1));
        });
        test('can shift microseconds', () {
          expect(it.shift(microseconds: 1), DateTime(2000, 1, 1, 1, 1, 1, 1, 2));
        });
      });
      group('subtracting parameters', () {
        final it = DateTime(2000, 1, 1, 1, 1, 1, 1, 1);
        test('can shift years', () {
          expect(it.shift(years: -1), DateTime(1999, 1, 1, 1, 1, 1, 1, 1));
        });
        test('can shift months', () {
          expect(it.shift(months: -1), DateTime(1999, 12, 1, 1, 1, 1, 1, 1));
        });
        test('can shift days', () {
          expect(it.shift(days: -1), DateTime(1999, 12, 31, 1, 1, 1, 1, 1));
        });
        test('can shift hours', () {
          expect(it.shift(hours: -1), DateTime(2000, 1, 1, 0, 1, 1, 1, 1));
        });
        test('can shift minutes', () {
          expect(it.shift(minutes: -1), DateTime(2000, 1, 1, 1, 0, 1, 1, 1));
        });
        test('can shift seconds', () {
          expect(it.shift(seconds: -1), DateTime(2000, 1, 1, 1, 1, 0, 1, 1));
        });
        test('can shift milliseconds', () {
          expect(it.shift(milliseconds: -1), DateTime(2000, 1, 1, 1, 1, 1, 0, 1));
        });
        test('can shift microseconds', () {
          expect(it.shift(microseconds: -1), DateTime(2000, 1, 1, 1, 1, 1, 1, 0));
        });
      });
      group('overflow', () {
        group('months', () {
          test('adding', () {
            final it = DateTime(2023, 11);
            expect(it.shift(months: 2), DateTime(2024));
          });
          test('subtracting', () {
            final it = DateTime(2023);
            expect(it.shift(months: -2), DateTime(2022, 11));
          });
        });
        group('days', () {
          test('adding', () {
            final it = DateTime(2023, 2, 27);
            expect(it.shift(days: 2), DateTime(2023, 3, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 1);
            expect(it.shift(days: -2), DateTime(2023, 1, 30));
          });
        });
        group('hours', () {
          test('adding', () {
            final it = DateTime(2023, 2, 1, 23);
            expect(it.shift(hours: 2), DateTime(2023, 2, 2, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 2, 1);
            expect(it.shift(hours: -2), DateTime(2023, 2, 1, 23));
          });
        });
        group('minutes', () {
          test('adding', () {
            final it = DateTime(2023, 2, 1, 1, 59);
            expect(it.shift(minutes: 2), DateTime(2023, 2, 1, 2, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 1, 1);
            expect(it.shift(minutes: -2), DateTime(2023, 2, 1, 0, 58));
          });
        });
        group('seconds', () {
          test('adding', () {
            final it = DateTime(2023, 2, 1, 1, 1, 59);
            expect(it.shift(seconds: 2), DateTime(2023, 2, 1, 1, 2, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 1, 1, 1);
            expect(it.shift(seconds: -2), DateTime(2023, 2, 1, 1, 0, 58));
          });
        });
        group('milliseconds', () {
          test('adding', () {
            final it = DateTime(2023, 2, 1, 1, 1, 1, 999);
            expect(it.shift(milliseconds: 2), DateTime(2023, 2, 1, 1, 1, 2, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 1, 1, 1, 1, 1);
            expect(it.shift(milliseconds: -2), DateTime(2023, 2, 1, 1, 1, 0, 999));
          });
        });
        group('microseconds', () {
          test('adding', () {
            final it = DateTime(2023, 2, 1, 1, 1, 1, 1, 999);
            expect(it.shift(microseconds: 2), DateTime(2023, 2, 1, 1, 1, 1, 2, 1));
          });
          test('subtracting', () {
            final it = DateTime(2023, 2, 1, 1, 1, 1, 1, 1);
            expect(it.shift(microseconds: -2), DateTime(2023, 2, 1, 1, 1, 1, 0, 999));
          });
        });
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
      withClock(Clock.fixed(date), () {
        expect(7.days.fromNow, date + 7.days);
      });
    });

    test('can be converted into a previous DateTime', () {
      withClock(Clock.fixed(date), () {
        expect(7.days.ago, date - 7.days);
      });
    });

    test('Can be used to pause the program flow', () async {
      final timeToWait = Duration(seconds: 2);
      final before = DateTime.now();
      await timeToWait.delay;
      final after = DateTime.now();
      final extraTime = after.millisecondsSinceEpoch - before.add(timeToWait).millisecondsSinceEpoch;
      expect(extraTime >= 0, true);
    });

    group('clamp', () {
      group('returns max when shorter than it', () {
        final it = Duration(days: 10, hours: 12);
        final min = Duration(days: 5);
        final max = Duration(days: 10);

        test('when it has a value for min', () {
          expect(it.clamp(min: min, max: max), equals(max));
        });

        test('when it does not have a value for min', () {
          expect(it.clamp(max: max), equals(max));
        });
      });

      group('returns min when longer than it', () {
        final it = Duration(hours: 18);
        final min = Duration(days: 5);
        final max = Duration(days: 10);

        test('when it has a value for max', () {
          expect(it.clamp(min: min, max: max), equals(min));
        });

        test('when it does not have a value for max', () {
          expect(it.clamp(min: min), equals(min));
        });
      });

      group('returns it', () {
        final it = Duration(days: 0);
        final min = Duration(days: -5);
        final max = Duration(days: 5);

        test('when both min and max are null', () {
          expect(it.clamp(), equals(it));
        });

        test('when is longer than min and max is null', () {
          expect(it.clamp(min: min), equals(it));
        });

        test('when is shorter than max and min is null', () {
          expect(it.clamp(max: max), equals(it));
        });

        test('when is longer than min and shorter than max', () {
          expect(it.clamp(min: min, max: max), equals(it));
        });
      });

      test('asserts that min should be shorter than max', () {
        final it = Duration(days: -0);
        final min = Duration(days: 5);
        final max = Duration(days: -5);
        expect(
          () => it.clamp(min: min, max: max),
          throwsA(isA<AssertionError>()),
        );
      });

      test('returns min/max if are equal', () {
        final it = Duration(days: -0);
        final min = Duration(days: 5);
        final max = min;
        expect(it.clamp(min: min, max: max), min);
      });
    });
  });
}
