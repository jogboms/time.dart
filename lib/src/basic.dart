extension on int {
  Duration get weeks => Duration(days: this * 7);

  Duration get days => Duration(days: this);

  Duration get hours => Duration(hours: this);

  Duration get minutes => Duration(minutes: this);

  Duration get seconds => Duration(seconds: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Duration get microseconds => Duration(microseconds: this);

  Duration get nanoseconds => Duration(microseconds: this ~/ 1000);
}
