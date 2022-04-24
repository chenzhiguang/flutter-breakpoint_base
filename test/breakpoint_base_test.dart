import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:breakpoint_base/breakpoint_base.dart';

void main() {
  test('iPad 11" portrait mode', () {
    const breakpoint = BreakpointBase(
      orientation: Orientation.portrait,
      width: 834,
    );

    expect(breakpoint.size, LayoutSize.small);
    expect(breakpoint.gutter, 24);
    expect(breakpoint.columns, 8);
  });

  test('iPad 11" portrait landscape', () {
    const breakpoint = BreakpointBase(
      orientation: Orientation.landscape,
      width: 1194,
    );

    expect(breakpoint.size, LayoutSize.medium);
    expect(breakpoint.gutter, 24);
    expect(breakpoint.columns, 12);
  });
}
