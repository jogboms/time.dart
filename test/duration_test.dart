import 'package:test/test.dart';
import 'package:time/time.dart';

void main() {
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
  });
}

// Checks if the two times returned a *just* about equal. Since `fromNow` and
// `ago` use DateTime.now(), we can't create an expected condition that is
// exactly equal.
Matcher _isAbout(DateTime expected) => predicate<DateTime>((dateTime) =>
    dateTime.millisecondsSinceEpoch - expected.millisecondsSinceEpoch < 1);
