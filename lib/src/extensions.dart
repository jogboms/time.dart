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
}

/// Enum representing the seasons
enum Season {
  winter,
  spring,
  summer,
  autumn,
}

extension InverseSeason on Season {
  Season get inverse => Season.values[(index + 2) % 4];
}


extension SeasonDate on DateTime {

  /// Retrieves the season for the current datetime instance
  Season get seasonNorth {
    switch (month) {
      case 1:
      case 2:
        return Season.winter;
      case 3:
        return day < 21 ? Season.winter : Season.spring;
      case 4:
      case 5:
        return Season.spring;
      case 6:
        return day < 21 ? Season.spring : Season.summer;
      case 7:
      case 8:
        return Season.summer;
      case 9:
        return day < 22 ? Season.autumn : Season.summer;
      case 10:
      case 11:
        return Season.autumn;
      case 12:
        return day < 22 ? Season.autumn : Season.winter;
      default:
        throw ArgumentError('This month doesnt exist #$month.');
    }
  }

  Season get seasonSouth => seasonNorth.inverse;
}
