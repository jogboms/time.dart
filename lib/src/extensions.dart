import 'package:meta/meta.dart';

extension NumTimeExtension<T extends num> on T {
  /// Returns a Duration represented in weeks
  Duration get weeks => days * DurationTimeExtension.daysPerWeek;

  /// Returns a Duration represented in days
  Duration get days => milliseconds * Duration.millisecondsPerDay;

  /// Returns a Duration represented in hours
  Duration get hours => milliseconds * Duration.millisecondsPerHour;

  /// Returns a Duration represented in minutes
  Duration get minutes => milliseconds * Duration.millisecondsPerMinute;

  /// Returns a Duration represented in seconds
  Duration get seconds => milliseconds * Duration.millisecondsPerSecond;

  /// Returns a Duration represented in milliseconds
  Duration get milliseconds => Duration(microseconds: (this * Duration.microsecondsPerMillisecond).toInt());

  /// Returns a Duration represented in microseconds
  Duration get microseconds => milliseconds ~/ Duration.microsecondsPerMillisecond;

  /// Returns a Duration represented in nanoseconds
  Duration get nanoseconds => microseconds ~/ DurationTimeExtension.nanosecondsPerMicrosecond;
}

extension DateTimeTimeExtension on DateTime {
  /// Adds this DateTime and Duration and returns the sum as a new DateTime object.
  DateTime operator +(Duration duration) => add(duration);

  /// Subtracts the Duration from this DateTime returns the difference as a new DateTime object.
  DateTime operator -(Duration duration) => subtract(duration);

  /// Returns a range of dates to [to], exclusive start, inclusive end
  /// ```dart
  /// final start = DateTime(2019);
  /// final end = DateTime(2020);
  /// start.to(end, by: const Duration(days: 365)).forEach(print); // 2020-01-01 00:00:00.000
  /// ```
  Iterable<DateTime> to(DateTime to, {Duration by = const Duration(days: 1)}) sync* {
    if (isAtSameMomentAs(to)) return;

    if (isBefore(to)) {
      var value = this + by;
      yield value;

      var count = 1;
      while (value.isBefore(to)) {
        value = this + (by * ++count);
        yield value;
      }
    } else {
      var value = this - by;
      yield value;

      var count = 1;
      while (value.isAfter(to)) {
        value = this - (by * ++count);
        yield value;
      }
    }
  }

  DateTime copyWith({
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
    int microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  /// Adds months
  DateTime addMonths(int months) {
    final result = copyWith(month: month + months);
    return result.day == day
        ? result
        : result.copyWith(
            month: result.month - 1,
            day: _daysInMonthOf(year: result.year, month: result.month - 1),
          );
  }

  /// Subtracts months
  DateTime subtractMonths(int months) {
    final result = copyWith(month: month - months);
    return result.day == day
        ? result
        : result.copyWith(
            month: result.month - 1,
            day: _daysInMonthOf(year: result.year, month: result.month - 1),
          );
  }

  /// Adds years
  DateTime addYears(int years) {
    final result = copyWith(year: year + years);
    return result.month == month
        ? result
        : result.copyWith(
            month: month,
            day: _daysInMonthOf(year: result.year, month: result.month - 1),
          );
  }

  /// Subtracts years
  DateTime subtractYears(int years) {
    final result = copyWith(year: year - years);
    return result.month == month
        ? result
        : result.copyWith(
            month: month,
            day: _daysInMonthOf(year: result.year, month: result.month - 1),
          );
  }

  /// days in month
  static final _daysInMonth = {
    1: 31,
    2: 28,
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
    'leap': 29,
  };

  /// is leap year for
  static bool _isLeapYearFor(int year) => (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// days in month of
  static int _daysInMonthOf({
    @required int year,
    @required int month,
  }) =>
      (month == DateTime.february && _isLeapYearFor(year)) ? _daysInMonth['leap'] : _daysInMonth[month];
}

extension DurationTimeExtension on Duration {
  static const int daysPerWeek = 7;
  static const int nanosecondsPerMicrosecond = 1000;

  /// Returns the representation in weeks
  int get inWeeks => (inDays / daysPerWeek).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the future
  DateTime get fromNow => DateTime.now() + this;

  @Deprecated('Use fromNow instead. Will be removed in 2.0.0')
  DateTime get later => fromNow;

  /// Subtracts the Duration from the current DateTime and returns a DateTime in the past
  DateTime get ago => DateTime.now() - this;

  /// Returns a Future.delayed from this
  Future<void> get delay => Future.delayed(this);
}
