// ignore_for_file: avoid_print

import 'package:breakpoint_base/breakpoint_base.dart';
import 'package:flutter/material.dart';

void main() {
  final breakpoint = Breakpoint(
    orientation: Orientation.landscape,
    width: 720,
  );

  print({
    'width': breakpoint.width,
    'orientation': breakpoint.orientation,
    'expanded': breakpoint.expanded,
    'size': breakpoint.size,
    'columns': breakpoint.columns,
    'gutter': breakpoint.gutter,
  }.toString());
}

class Breakpoint extends BreakpointBase {
  Breakpoint({required Orientation orientation, required double width})
      : super(orientation: orientation, width: width);

  @override
  LayoutSize get size => findValue({
        0: LayoutSize.small,
        800: LayoutSize.medium,
        1600: LayoutSize.large,
      });

  @override
  double get gutter => findValue({0: 16, 800: 24, 1600: 50});

  // Add one more property
  bool get expanded => orientation == Orientation.landscape || width >= 1600;
}
