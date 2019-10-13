# ⏰ Time

[![codecov](https://codecov.io/gh/jogboms/time.dart/branch/master/graph/badge.svg)](https://codecov.io/gh/jogboms/time.dart) [![pub package](https://img.shields.io/pub/v/time.svg)](https://pub.dartlang.org/packages/time)

With shiny extensions, if you have ever written something like this, then look no further:

```dart
final DateTime fourHoursFromNow = DateTime.now() + Duration(hours: 4);
```

## 🎖 Installation
```yaml
dependencies:
  time: "^0.0.1"
```

### ⚡ Import

```dart
import 'package:time/time.dart';
```

## 🎮 Usage

```dart
final Duration tenMinutes = 10.minutes;
final DateTime afterTenMinutes = DateTime.now() + 10.minutes;
final Duration tenMinutesAndSome = 10.minutes + 15.seconds;
final int tenMinutesInSeconds = 10.minutes.inSeconds;
final DateTime tenMinutesLater = 10.minutes.later;
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
final DateTime timeInFuture = 5.minutes.later;
final DateTime timeInPast = 5.minutes.ago;
```

## 🐛 Bugs/Requests

If you encounter any problems feel free to open an issue. If you feel the library is missing a feature, please raise a ticket on Github and I'll look into it. Pull request are also welcome.

## 👏 Inspiration

- Swift library of the same name - [Time](https://github.com/dreymonde/Time).
- Kotlin library of the same name - [Time](https://github.com/kizitonwose/Time).

## ⭐ License

MIT License
