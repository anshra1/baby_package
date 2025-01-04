import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  // Basic padding in all directions
  Widget pad(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  // Directional padding
  Widget padLeft(double padding) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );

  Widget padRight(double padding) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );

  Widget padTop(double padding) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );

  Widget padBottom(double padding) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );

  // Combination directional padding
  Widget padHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  Widget padVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget padLeftRight(double left, double right) => Padding(
        padding: EdgeInsets.only(left: left, right: right),
        child: this,
      );

  Widget padTopBottom(double top, double bottom) => Padding(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        child: this,
      );

  // Custom padding
  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );
}
