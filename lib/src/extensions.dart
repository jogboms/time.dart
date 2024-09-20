import 'package:clock/clock.dart';

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

  /// Returns only year, month and day
  DateTime get date => isUtc ? DateTime.utc(year, month, day) : DateTime(year, month, day);

  /// Returns only the time
  Duration get timeOfDay => hour.hours + minute.minutes + second.seconds;

  /// Returns if today, true
  bool get isToday {
    return _calculateDifference(this) == 0;
  }

  /// Returns if tomorrow, true
  bool get isTomorrow {
    return _calculateDifference(this) == 1;
  }

  /// Returns if yesterday, true
  bool get wasYesterday {
    return _calculateDifference(this) == -1;
  }

  /// Returns true if this year is a leap year.
  bool get isLeapYear =>
      // Leap years are used since 1582.
      year >= 1582 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);

  /// Returns the amount of days that are in this month.
  ///
  /// Accounts for leap years.
  int get daysInMonth {
    final days = [
      31, // January
      if (isLeapYear) 29 else 28, // February
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];

    return days[month - 1];
  }

  /// Returns true if [other] is in the same year as [this].
  ///
  /// Does not account for timezones.
  bool isAtSameYearAs(DateTime other) => year == other.year;

  /// Returns true if [other] is in the same month as [this].
  ///
  /// This means the exact month, including year.
  ///
  /// Does not account for timezones.
  bool isAtSameMonthAs(DateTime other) => isAtSameYearAs(other) && month == other.month;

  /// Returns true if [other] is on the same day as [this].
  ///
  /// This means the exact day, including year and month.
  ///
  /// Does not account for timezones.
  bool isAtSameDayAs(DateTime other) => isAtSameMonthAs(other) && day == other.day;

  /// Returns true if [other] is at the same hour as [this].
  ///
  /// This means the exact hour, including year, month and day.
  ///
  /// Does not account for timezones.
  bool isAtSameHourAs(DateTime other) => isAtSameDayAs(other) && hour == other.hour;

  /// Returns true if [other] is at the same minute as [this].
  ///
  /// This means the exact minute, including year, month, day and hour.
  ///
  /// Does not account for timezones.
  bool isAtSameMinuteAs(DateTime other) => isAtSameHourAs(other) && minute == other.minute;

  /// Returns true if [other] is at the same second as [this].
  ///
  /// This means the exact second, including year, month, day, hour and minute.
  ///
  /// Does not account for timezones.
  bool isAtSameSecondAs(DateTime other) => isAtSameMinuteAs(other) && second == other.second;

  /// Returns true if [other] is at the same millisecond as [this].
  ///
  /// This means the exact millisecond,
  /// including year, month, day, hour, minute and second.
  ///
  /// Does not account for timezones.
  bool isAtSameMillisecondAs(DateTime other) => isAtSameSecondAs(other) && millisecond == other.millisecond;

  /// Returns true if [other] is at the same microsecond as [this].
  ///
  /// This means the exact microsecond,
  /// including year, month, day, hour, minute, second and millisecond.
  ///
  /// Does not account for timezones.
  bool isAtSameMicrosecondAs(DateTime other) => isAtSameMillisecondAs(other) && microsecond == other.microsecond;

  static int _calculateDifference(DateTime date) {
    final now = clock.now();
    return DateTime(date.year, date.month, date.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  }

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
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return isUtc
        ? DateTime.utc(
            year ?? this.year,
            month ?? this.month,
            day ?? this.day,
            hour ?? this.hour,
            minute ?? this.minute,
            second ?? this.second,
            millisecond ?? this.millisecond,
            microsecond ?? this.microsecond,
          )
        : DateTime(
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

  /// Returns the Monday of this week
  DateTime get firstDayOfWeek =>
      isUtc ? DateTime.utc(year, month, day + 1 - weekday) : DateTime(year, month, day + 1 - weekday);

  /// Returns the Sunday of this week
  DateTime get lastDayOfWeek =>
      isUtc ? DateTime.utc(year, month, day + 7 - weekday) : DateTime(year, month, day + 7 - weekday);

  /// Returns the first day of this month
  DateTime get firstDayOfMonth => isUtc ? DateTime.utc(year, month, 1) : DateTime(year, month, 1);

  /// Returns the last day of this month (considers leap years)
  DateTime get lastDayOfMonth => isUtc ? DateTime.utc(year, month + 1, 0) : DateTime(year, month + 1, 0);

  /// Returns the first day of this year
  DateTime get firstDayOfYear => isUtc ? DateTime.utc(year, 1, 1) : DateTime(year, 1, 1);

  /// Returns the last day of this year
  DateTime get lastDayOfYear => isUtc ? DateTime.utc(year, 12, 31) : DateTime(year, 12, 31);

  /// Returns this [DateTime] clamped to be in the range [min]-[max].
  ///
  /// The comparison is done using [compareTo].
  ///
  /// The arguments [min] and [max] must form a valid range where
  /// `min.compareTo(max) <= 0`.
  ///
  /// Example:
  /// ```dart
  /// var result = DateTime(2022, DateTime.october, 15).clamp(
  ///   min: DateTime(2022, DateTime.september, 1),
  ///   max: DateTime(2022, DateTime.september, 30),
  /// ); // DateTime(2022, DateTime.september, 30);
  /// result = DateTime(2022, DateTime.august, 21).clamp(
  ///   min: DateTime(2022, DateTime.september, 15),
  ///   max: DateTime(2022, DateTime.september, 30),
  /// ); // DateTime(2022, DateTime.september, 15);
  /// result = DateTime(2022, DateTime.september, 1).clamp(
  ///   min: DateTime(2022, DateTime.august, 1),
  ///   max: DateTime(2022, DateTime.september, 30),
  /// ); // DateTime(2022, DateTime.september, 1);
  /// ```
  DateTime clamp({DateTime? min, DateTime? max}) {
    assert(
      ((min != null) && (max != null)) ? (min.isBefore(max) || (min == max)) : true,
      'DateTime min has to be before or equal to max\n(min: $min - max: $max)',
    );
    if ((min != null) && compareTo(min).isNegative) {
      return min;
    } else if ((max != null) && max.compareTo(this).isNegative) {
      return max;
    }
    return this;
  }

  /// Adds time units to the calendar date and/or clock time.
  ///
  /// Creates a new [DateTime] object with a calendar date offset from
  /// that of the the current one by the provided number of years, months, and/or days,
  /// and a wall clock time offset from that of the current one by the provided
  /// hours, minutes, seconds, milliseconds and/or microseconds.
  ///
  /// The provided time units can be positive or negative, or any combination.
  /// Overflowing, say by adding more than 30 days to a any date, works like
  /// in the [DateTime] constructor.
  /// The resulting day and time must be within the supported range for
  /// the `DateTime` class.
  DateTime shift({
    int years = 0,
    int months = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) =>
      copyWith(
        year: year + years,
        month: month + months,
        day: day + days,
        hour: hour + hours,
        minute: minute + minutes,
        second: second + seconds,
        millisecond: millisecond + milliseconds,
        microsecond: microsecond + microseconds,
      );

  bool get isWeekend => (weekday == DateTime.saturday) || (weekday == DateTime.sunday);

  bool get isWorkday => !isWeekend;

  /// Returns the last microsecond of the day (23:59:59.999999)
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// date.endOfDay; // 2020-01-01 23:59:59.999999
  /// final date = DateTime(2020, 1, 1, 12, 30, 15, 123, 456);
  /// date.endOfDay; // 2020-01-01 23:59:59.999999
  /// ```
  DateTime get endOfDay {
    const microsecond = Duration(microseconds: 1);
    if (isUtc) return DateTime.utc(year, month, day + 1) - microsecond;
    return DateTime(year, month, day + 1) - microsecond;
  }
}

extension DurationTimeExtension on Duration {
  static const int daysPerWeek = 7;
  static const int nanosecondsPerMicrosecond = 1000;

  /// Returns the representation in weeks
  int get inWeeks => (inDays / daysPerWeek).ceil();

  /// Adds the Duration to the current DateTime and returns a DateTime in the future
  DateTime get fromNow => clock.now() + this;

  /// Subtracts the Duration from the current DateTime and returns a DateTime in the past
  DateTime get ago => clock.now() - this;

  /// Returns a Future.delayed from this
  Future<void> get delay => Future.delayed(this);

  /// Returns this [Duration] clamped to be in the range [min]-[max].
  ///
  /// The comparison is done using [compareTo].
  ///
  /// The arguments [min] and [max] must form a valid range where
  /// `min.compareTo(max) <= 0`.
  ///
  /// Example:
  /// ```dart
  /// var result = Duration(days: 10, hours: 12).clamp(
  ///   min: Duration(days: 5),
  ///   max: Duration(days: 10),
  /// ); // Duration(days: 10)
  /// result = Duration(hours: 18).clamp(
  ///   min: Duration(days: 5),
  ///   max: Duration(days: 10),
  /// ); // Duration(days: 5)
  /// result = Duration(days: 0).clamp(
  ///   min: Duration(days: -5),
  ///   max: Duration(days: 5),
  /// ); // Duration(days: 0)
  /// ```
  Duration clamp({Duration? min, Duration? max}) {
    assert(
      ((min != null) && (max != null)) ? min.compareTo(max) <= 0 : true,
      'Duration min has to be shorter than max\n(min: $min - max: $max)',
    );
    if ((min != null) && compareTo(min).isNegative) {
      return min;
    } else if ((max != null) && max.compareTo(this).isNegative) {
      return max;
    }
    return this;
  }
}
