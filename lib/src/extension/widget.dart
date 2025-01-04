import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  // clipReact
  Widget withRadius(BorderRadius radius) => ClipRRect(
        borderRadius: radius,
        child: this,
      );

  Widget withCircularRadius(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );

  //
  Widget center() => Center(child: this);

  Widget padding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );

  Widget margin(EdgeInsetsGeometry margin) => Container(
        margin: margin,
        child: this,
      );

  Widget expanded([int flex = 1]) => Expanded(
        flex: flex,
        child: this,
      );

  Widget flexible([int flex = 1, FlexFit fit = FlexFit.loose]) => Flexible(
        flex: flex,
        fit: fit,
        child: this,
      );

  Widget card({
    Color? color,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) =>
      Card(
        color: color,
        elevation: elevation,
        shape: shape,
        margin: margin,
        child: padding != null ? Padding(padding: padding, child: this) : this,
      );

  Widget clip({
    double radius = 8,
    CustomClipper<RRect>? clipper,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        clipper: clipper,
        child: this,
      );

  Widget aspectRatio(double aspectRatio) => AspectRatio(
        aspectRatio: aspectRatio,
        child: this,
      );

  Widget scrollable({
    ScrollPhysics? physics,
    ScrollController? controller,
    Axis scrollDirection = Axis.vertical,
  }) =>
      SingleChildScrollView(
        physics: physics,
        controller: controller,
        scrollDirection: scrollDirection,
        child: this,
      );

  // Widget shimmer({bool enabled = true}) => AppShimmer(
  //       enabled: enabled,
  //       child: this,
  //     );

  // Widget animate({
  //   Duration? duration,
  //   Curve? curve,
  // }) =>
  //     AppAnimationController(
  //       duration: duration ?? MotionTokens.durationMD,
  //       curve: curve ?? MotionTokens.standard,
  //       child: this,
  //     );
}
