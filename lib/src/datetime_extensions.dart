part of time;

extension DateTimeTimeExtension on DateTime {

  /// Returns a new [DateTime] instance with [duration] added to [this].
  DateTime operator +(Duration duration) => add(duration);

  /// Returns a new [DateTime] instance with [duration] subtracted from [this].
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
