extension on Duration {
  /// Returns the representation in weeks
  int get inWeeks => (inDays / 4).ceil();

  /// Adds the Duration to the current DateTime
  /// Returns a DateTime in the future
  DateTime get fromNow => DateTime.now() + this;

  /// Subtracts the Duration from the current DateTime
  /// Returns a DateTime in the past
  DateTime get ago => DateTime.now() - this;
}
