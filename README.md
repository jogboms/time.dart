# ⏰ Time

[![Build Status - Travis](https://travis-ci.org/jogboms/time.dart.svg?branch=master)](https://travis-ci.org/jogboms/time.dart) [![codecov](https://codecov.io/gh/jogboms/time.dart/branch/master/graph/badge.svg)](https://codecov.io/gh/jogboms/time.dart) [![pub package](https://img.shields.io/pub/v/time.svg)](https://pub.dartlang.org/packages/time)

With shiny extensions, if you have ever written something like this, then look no further:

```dart
final DateTime fourHoursFromNow = DateTime.now() + Duration(hours: 4);
```

## 🎖 Installation
```yaml
dependencies:
  time: "^1.3.0"
```

### ⚡ Import

```dart
import 'package:time/time.dart';
```

## 🎮 Usage

```dart
final Duration tenMinutes = 10.minutes;
final Duration oneHourThirtyMinutes = 1.5.hours;
final DateTime afterTenMinutes = DateTime.now() + 10.minutes;
final Duration tenMinutesAndSome = 10.minutes + 15.seconds;
final int tenMinutesInSeconds = 10.minutes.inSeconds;
final DateTime tenMinutesFromNow = 10.minutes.fromNow;
```

You can perform all basic arithmetic operations on `Duration` as you always have been:

```dart
final Duration interval = 10.minutes + 15.seconds - 3.minutes + 2.hours;
final Duration doubled = interval * 2;
```

You can also use these operations on `DateTime`:

```dart
final DateTime oneHourAfter = DateTime() + 1.hours;
```

`Duration` is easily convertible as it always has been:

```dart
final int twoMinutesInSeconds = 2.minutes.inSeconds;
```

You can also convert `Duration` to `DateTime`, if needed:

```dart
final DateTime timeInFuture = 5.minutes.fromNow;
final DateTime timeInPast = 5.minutes.ago;
```

Iterate through a `DateTime` range:

```dart
final DateTime start = DateTime(2019, 12, 2);
final DateTime end = start + 1.weeks;
final DateTime tuesday = start.to(end).firstWhere((date) => date.weekday == DateTime.tuesday);
```

Granular comparison between `DateTime` fields:

```dart
final DateTime specificDate = DateTime(2021, 01, 01);
final DateTime otherDate = DateTime(2021, 02, 01);

print(specificDate.isAtSameYearAs(otherDate)); // true
print(specificDate.isAtSameMonthAs(otherDate)); // false
print(specificDate.isAtSameDayAs(otherDate)); // false
```

You can also delay code execution:

```dart
void doSomething() async {
  await 5.seconds.delay;
  // Do the other things
}
```

You can also use the popular `copyWith`:

```dart
final initial = DateTime(2019, 2, 4, 24, 50, 45, 1, 1);
final expected = initial.copyWith(
  year: 2021,
  month: 10,
  day: 28,
  hour: 12,
  minute: 45,
  second: 10,
  millisecond: 0,
  microsecond: 12,
);
```

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is missing a feature, please raise a ticket on Github and I'll look into it. Pull request are also welcome.

## 👏 Inspiration

- Swift library of the same name - [Time](https://github.com/dreymonde/Time).
- Kotlin library of the same name - [Time](https://github.com/kizitonwose/Time).

## ⭐ License

MIT License
