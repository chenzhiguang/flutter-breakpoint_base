A base class to define Flutter breakpoint properties.

## Basic usage

Use default breakpoints:

| Width(Logical pixels) | Size   | Columns | Gutter |
| --------------------- | ------ | ------- | ------ |
| 0 - 599               | xsmall | 4       | 16     |
| 600 - 719             | small  | 8       | 16     |
| 720 - 839             | small  | 8       | 24     |
| 840 - 1023            | small  | 12      | 24     |
| 1024 - 1439           | medium | 12      | 24     |
| 1440 - 1919           | large  | 12      | 24     |
| 1920+                 | xlarge | 12      | 24     |

```dart
final media = MediaQuery.of(context);

final breakpoint = BreakpointBase(
  orientation: media.orientation,
  width: media.size.width,
);
```

## Advanced usage

To customise breakpoints:

| Width      | Size   | Gutter | Expanded(portrait) | Expanded(landscape) |
| ---------- | ------ | ------ | ------------------ | ------------------- |
| 0 - 799    | small  | 16     | false              | true                |
| 800 - 1599 | medium | 24     | false              | true                |
| 1600+      | large  | 50     | true               | true                |

```dart
final media = MediaQuery.of(context);

final breakpoint = Breakpoint(
  orientation: media.orientation,
  width: media.size.width,
);

//
class Breakpoint extends BreakpointBase {
  Breakpoint({required Orientation orientation, required double width})
      : super(orientation: orientation, width: width);

  @override
  LayoutSize get size => _findValue({
      0: LayoutSize.small,
      800: LayoutSize.medium,
      1600: LayoutSize.large,
    });

  @override
  int get gutter => _findValue({0: 16, 800: 24, 1600: 50});

  // Add one more property
  bool get expanded => orientation == Orientation.landscape || width >= 1600;
}
```
