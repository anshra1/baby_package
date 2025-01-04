import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension SystemUiOverlayStyleExtension on bool {
  SystemUiOverlayStyle get systemOverlayStyle {
    return this
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
          )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
          );
  }
}
