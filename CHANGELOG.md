## 2.1.5

- Introduce `endOfDay` extension to `DateTime`

## 2.1.4

- Introduce `shift` extension to `DateTime`

## 2.1.3

- Introduce `isWeekend` extension to `DateTime`
- Introduce `isWorkday` extension to `DateTime`

## 2.1.2

- Fix `min` and `max` assertion with `clamp` extension

## 2.1.1

- Introduce `firstDayOfWeek` extension to `DateTime`
- Introduce `lastDayOfWeek` extension to `DateTime`
- Introduce `firstDayOfMonth` extension to `DateTime`
- Introduce `lastDayOfMonth` extension to `DateTime`
- Introduce `firstDayOfYear` extension to `DateTime`
- Introduce `lastDayOfYear` extension to `DateTime`
- Introduce `clamp` extension to `DateTime`
- Introduce `clamp` extension to `Duration`

## 2.1.0

- Introduce `package:clock` dependency for more predictable testing

## 2.0.1

- Implement utc support for `copyWith` operation

## 2.0.0

- Migrate to null-safety

## 1.5.0-nullsafety.1

- Introduce `isAtSameYearAs` extension to `DateTime`
- Introduce `isAtSameMonthAs` extension to `DateTime`
- Introduce `isAtSameDayAs` extension to `DateTime`
- Introduce `isAtSameHourAs` extension to `DateTime`
- Introduce `isAtSameMinuteAs` extension to `DateTime`
- Introduce `isAtSameMillisecondAs` extension to `DateTime`
- Introduce `isAtSameMicrosecondAs` extension to `DateTime`
- Introduce `isLeapYear` extension to `DateTime`
- Introduce `daysInMonth` extension to `DateTime`

```dart
final DateTime specificDate = DateTime(2021, 01, 01);
final DateTime otherDate = DateTime(2021, 02, 01);

print(specificDate.isAtSameYearAs(otherDate)); // true
print(specificDate.isAtSameMonthAs(otherDate)); // false
print(specificDate.isAtSameDayAs(otherDate)); // false
```

## 1.4.1

- Introduce `isAtSameYearAs` extension to `DateTime`
- Introduce `isAtSameMonthAs` extension to `DateTime`
- Introduce `isAtSameDayAs` extension to `DateTime`
- Introduce `isAtSameHourAs` extension to `DateTime`
- Introduce `isAtSameMinuteAs` extension to `DateTime`
- Introduce `isAtSameMillisecondAs` extension to `DateTime`
- Introduce `isAtSameMicrosecondAs` extension to `DateTime`
- Introduce `isLeapYear` extension to `DateTime`
- Introduce `daysInMonth` extension to `DateTime`

## 1.5.0-nullsafety.0
- Migrated to null-safe dart

## 1.4.0

- Introduce `isToday` extension to `Duration`
- Introduce `isTomorrow` extension to `DateTime`
- Introduce `wasYesterday` extension to `DateTime`

## 1.3.0

- Introduce `delay` extension to `Duration`
- Introduce `copyWith` extension to `DateTime`

## 1.2.0

- Iterate through a `DateTime` range:

```dart
final DateTime start = DateTime(2019, 12, 2);
final DateTime end = start + 1.weeks;
final DateTime tuesday = start.to(end).firstWhere((date) => date.weekday == DateTime.tuesday);
```

## 1.1.1

- Fix breaking change from v1.1.0 by introducing @deprecated flag

## 1.1.0

- Breaking Change: renamed `later` to `fromNow` to align with other ecosystems
- Introduced support for other variants of `num` i.e `double`

## 1.0.0

- Named extensions to allow discoverability
- Introduced quality control test cases

## 0.0.1+1

- Unify extensions for int, Duration & DateTime

## 0.0.1

- Initial version
