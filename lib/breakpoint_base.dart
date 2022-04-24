library breakpoint_base;

import 'package:flutter/material.dart';

class BreakpointBase {
  const BreakpointBase({
    required this.orientation,
    required this.width,
  });

  final Orientation orientation;
  final double width;

  LayoutSize get size => findValue({
        0: LayoutSize.xsmall,
        600: LayoutSize.small,
        1024: LayoutSize.medium,
        1440: LayoutSize.large,
        1920: LayoutSize.xlarge,
      });

  int get columns => findValue({0: 4, 600: 8, 840: 12});
  int get gutter => findValue({0: 16, 720: 24});

  V findValue<V>(Map<double, V> map) {
    final entries = map.entries.toList()
      ..sort(((a, b) => b.key.compareTo(a.key)));

    assert(entries.any((element) => element.key == 0));

    return entries.firstWhere((element) => width >= element.key).value;
  }
}

enum LayoutSize { xsmall, small, medium, large, xlarge }
