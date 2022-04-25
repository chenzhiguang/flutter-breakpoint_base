import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:breakpoint_base/breakpoint_base.dart';

void main() {
  test('iPad 11" portrait mode', () {
    const breakpoint = BreakpointBase(
      orientation: Orientation.portrait,
      width: 834,
    );

    expect(breakpoint.gutter, 24);
    expect(breakpoint.columns, 8);
    expect(breakpoint.size, LayoutSize.small);
    expect(breakpoint.isLargerThan(LayoutSize.xsmall), true);
    expect(breakpoint.isLargerThan(LayoutSize.small), false);
    expect(breakpoint.isLargerThan(LayoutSize.large), false);
    expect(breakpoint.isSmallerThan(LayoutSize.xsmall), false);
    expect(breakpoint.isSmallerThan(LayoutSize.small), false);
    expect(breakpoint.isSmallerThan(LayoutSize.large), true);
  });

  test('iPad 11" portrait landscape', () {
    const breakpoint = BreakpointBase(
      orientation: Orientation.landscape,
      width: 1194,
    );

    expect(breakpoint.gutter, 24);
    expect(breakpoint.columns, 12);
    expect(breakpoint.size, LayoutSize.medium);
    expect(breakpoint.isLargerThan(LayoutSize.xsmall), true);
    expect(breakpoint.isLargerThan(LayoutSize.small), true);
    expect(breakpoint.isLargerThan(LayoutSize.large), false);
    expect(breakpoint.isSmallerThan(LayoutSize.xsmall), false);
    expect(breakpoint.isSmallerThan(LayoutSize.small), false);
    expect(breakpoint.isSmallerThan(LayoutSize.large), true);
  });
}
