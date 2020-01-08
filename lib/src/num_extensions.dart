
part of time;

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
