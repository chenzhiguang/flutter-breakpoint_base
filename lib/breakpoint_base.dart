library breakpoint_base;

import 'package:flutter/material.dart';

class BreakpointBase {
  const BreakpointBase({
    required this.orientation,
    required this.width,
  });

  /// Whether in portrait or landscape.
  final Orientation orientation;

  /// Layout width
  final double width;

  /// Layout size
  LayoutSize get size => findValue({
        0: LayoutSize.xsmall,
        600: LayoutSize.small,
        1024: LayoutSize.medium,
        1440: LayoutSize.large,
        1920: LayoutSize.xlarge,
      });

  /// Number of columns for content
  int get columns => findValue({0: 4, 600: 8, 840: 12});

  /// Spacing between columns
  double get gutter => findValue({0: 16, 720: 24});

  /// Find the value which matches current [size] from [map]
  V findValue<V>(Map<double, V> map) {
    final entries = map.entries.toList()
      ..sort(((a, b) => b.key.compareTo(a.key)));

    assert(entries.any((element) => element.key == 0));

    return entries.firstWhere((element) => width >= element.key).value;
  }

  /// If current [LayoutSize] is larger than [size]
  bool isLargerThan(LayoutSize size) => this.size.index > size.index;

  /// If current [LayoutSize] is smaller than [size]
  bool isSmallerThan(LayoutSize size) => this.size.index < size.index;
}

enum LayoutSize { xsmall, small, medium, large, xlarge }
