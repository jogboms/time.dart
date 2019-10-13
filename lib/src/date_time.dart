extension on DateTime {
  /// Adds this DateTime and Duration and
  /// returns the sum as a new DateTime object.
  DateTime operator +(Duration duration) {
    return DateTime.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch + duration.inMilliseconds);
  }

  /// Subtracts the Duration from this DateTime
  /// returns the difference as a new DateTime object.
  DateTime operator -(Duration duration) {
    return DateTime.fromMillisecondsSinceEpoch(this.millisecondsSinceEpoch - duration.inMilliseconds);
  }
}
