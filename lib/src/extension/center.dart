import 'package:flutter/material.dart';

extension CenterExtension on Widget {
  /// Centers the widget
  Widget center() => Center(child: this);

  /// Centers the widget with a specific alignment
  Widget centerWith(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );

  /// Centers the widget horizontally
  Widget centerHorizontal() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  /// Centers the widget vertically
  Widget centerVertical() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [this],
      );

  /// Centers the widget and adds padding
  Widget centerPadded(EdgeInsetsGeometry padding) => Center(
        child: Padding(
          padding: padding,
          child: this,
        ),
      );
}
