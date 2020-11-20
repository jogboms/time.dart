## 1.4.0-nullsafety.0
- Upgraded to null-safe dart

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
