import 'package:flutter/material.dart';

extension ListExtensions<T> on List<T> {
  List<T> addBetween(T separator) {
    if (length <= 1) return this;
    return expand((item) sync* {
      if (indexOf(item) > 0) yield separator;
      yield item;
    }).toList();
  }

  List<Widget> separatedBy(Widget separator) {
    if (isEmpty) return [];
    if (length == 1) return [this[0] as Widget];

    final result = <Widget>[];
    for (var i = 0; i < length; i++) {
      result.add(this[i] as Widget);
      if (i < length - 1) result.add(separator);
    }
    return result;
  }

  List<Widget> gap(double size) {
    return separatedBy(SizedBox(height: size, width: size));
  }
}
