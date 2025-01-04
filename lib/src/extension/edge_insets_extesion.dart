import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EdgeInsetsNumExtension on num {
  // Basic EdgeInsets
  EdgeInsets get edgeAll => EdgeInsets.all(toDouble());
  EdgeInsets get edgeHorizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get edgeVertical => EdgeInsets.symmetric(vertical: toDouble());

  // Directional EdgeInsets
  EdgeInsets get edgeLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get edgeRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get edgeTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get edgeBottom => EdgeInsets.only(bottom: toDouble());

  // Responsive EdgeInsets (using ScreenUtil)
  EdgeInsets get edgeAllResponsive => EdgeInsets.all(w);
  EdgeInsets get edgeHorizontalResponsive => EdgeInsets.symmetric(horizontal: w);
  EdgeInsets get edgeVerticalResponsive => EdgeInsets.symmetric(vertical: h);

  // Short forms for quick use
  EdgeInsets get all => edgeAll;
  EdgeInsets get horizontal => edgeHorizontal;
  EdgeInsets get vertical => edgeVertical;

  // Short forms for responsive
  EdgeInsets get allR => edgeAllResponsive;
  EdgeInsets get horizontalR => edgeHorizontalResponsive;
  EdgeInsets get verticalR => edgeVerticalResponsive;
}

extension EdgeInsetsX on EdgeInsets {
  // Symmetrical paddings
  static EdgeInsets get h4 => const EdgeInsets.symmetric(horizontal: 4);
  static EdgeInsets get h8 => const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets get h12 => const EdgeInsets.symmetric(horizontal: 12);
  static EdgeInsets get h16 => const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets get h20 => const EdgeInsets.symmetric(horizontal: 20);
  static EdgeInsets get h24 => const EdgeInsets.symmetric(horizontal: 24);
  static EdgeInsets get h32 => const EdgeInsets.symmetric(horizontal: 32);

  static EdgeInsets get v4 => const EdgeInsets.symmetric(vertical: 4);
  static EdgeInsets get v8 => const EdgeInsets.symmetric(vertical: 8);
  static EdgeInsets get v12 => const EdgeInsets.symmetric(vertical: 12);
  static EdgeInsets get v16 => const EdgeInsets.symmetric(vertical: 16);
  static EdgeInsets get v20 => const EdgeInsets.symmetric(vertical: 20);
  static EdgeInsets get v24 => const EdgeInsets.symmetric(vertical: 24);
  static EdgeInsets get v32 => const EdgeInsets.symmetric(vertical: 32);

  // All side paddings
  static EdgeInsets get a4 => const EdgeInsets.all(4);
  static EdgeInsets get a8 => const EdgeInsets.all(8);
  static EdgeInsets get a12 => const EdgeInsets.all(12);
  static EdgeInsets get a16 => const EdgeInsets.all(16);
  static EdgeInsets get a20 => const EdgeInsets.all(20);
  static EdgeInsets get a24 => const EdgeInsets.all(24);
  static EdgeInsets get a32 => const EdgeInsets.all(32);

  // Left only paddings
  static EdgeInsets get l4 => const EdgeInsets.only(left: 4);
  static EdgeInsets get l8 => const EdgeInsets.only(left: 8);
  static EdgeInsets get l12 => const EdgeInsets.only(left: 12);
  static EdgeInsets get l16 => const EdgeInsets.only(left: 16);
  static EdgeInsets get l20 => const EdgeInsets.only(left: 20);
  static EdgeInsets get l24 => const EdgeInsets.only(left: 24);
  static EdgeInsets get l32 => const EdgeInsets.only(left: 32);

  // Right only paddings
  static EdgeInsets get r4 => const EdgeInsets.only(right: 4);
  static EdgeInsets get r8 => const EdgeInsets.only(right: 8);
  static EdgeInsets get r12 => const EdgeInsets.only(right: 12);
  static EdgeInsets get r16 => const EdgeInsets.only(right: 16);
  static EdgeInsets get r20 => const EdgeInsets.only(right: 20);
  static EdgeInsets get r24 => const EdgeInsets.only(right: 24);
  static EdgeInsets get r32 => const EdgeInsets.only(right: 32);

  // Top only paddings
  static EdgeInsets get t4 => const EdgeInsets.only(top: 4);
  static EdgeInsets get t8 => const EdgeInsets.only(top: 8);
  static EdgeInsets get t12 => const EdgeInsets.only(top: 12);
  static EdgeInsets get t16 => const EdgeInsets.only(top: 16);
  static EdgeInsets get t20 => const EdgeInsets.only(top: 20);
  static EdgeInsets get t24 => const EdgeInsets.only(top: 24);
  static EdgeInsets get t32 => const EdgeInsets.only(top: 32);

  // Bottom only paddings
  static EdgeInsets get b4 => const EdgeInsets.only(bottom: 4);
  static EdgeInsets get b8 => const EdgeInsets.only(bottom: 8);
  static EdgeInsets get b12 => const EdgeInsets.only(bottom: 12);
  static EdgeInsets get b16 => const EdgeInsets.only(bottom: 16);
  static EdgeInsets get b20 => const EdgeInsets.only(bottom: 20);
  static EdgeInsets get b24 => const EdgeInsets.only(bottom: 24);
  static EdgeInsets get b32 => const EdgeInsets.only(bottom: 32);
}

/// Responsive EdgeInsets extension using ScreenUtil
extension EdgeInsetsResponsive on EdgeInsets {
  // Responsive symmetric paddings
  static EdgeInsets get rh4 => EdgeInsets.symmetric(horizontal: 4.w);
  static EdgeInsets get rh8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get rh12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get rh16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get rh20 => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get rh24 => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get rh32 => EdgeInsets.symmetric(horizontal: 32.w);

  static EdgeInsets get rv4 => EdgeInsets.symmetric(vertical: 4.h);
  static EdgeInsets get rv8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get rv12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get rv16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get rv20 => EdgeInsets.symmetric(vertical: 20.h);
  static EdgeInsets get rv24 => EdgeInsets.symmetric(vertical: 24.h);
  static EdgeInsets get rv32 => EdgeInsets.symmetric(vertical: 32.h);

  // Responsive all side paddings
  static EdgeInsets get ra4 => EdgeInsets.all(4.r);
  static EdgeInsets get ra8 => EdgeInsets.all(8.r);
  static EdgeInsets get ra12 => EdgeInsets.all(12.r);
  static EdgeInsets get ra16 => EdgeInsets.all(16.r);
  static EdgeInsets get ra20 => EdgeInsets.all(20.r);
  static EdgeInsets get ra24 => EdgeInsets.all(24.r);
  static EdgeInsets get ra32 => EdgeInsets.all(32.r);

  // Utility method for custom responsive paddings
  static EdgeInsets responsive({
    double horizontal = 0,
    double vertical = 0,
    double all = 0,
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    if (all > 0) {
      return EdgeInsets.all(all.r);
    }

    return EdgeInsets.only(
      left: (left > 0 ? left : horizontal).w,
      right: (right > 0 ? right : horizontal).w,
      top: (top > 0 ? top : vertical).h,
      bottom: (bottom > 0 ? bottom : vertical).h,
    );
  }

  // Extension for RTL-aware padding
  static EdgeInsets symmetricRTL(
    BuildContext context, {
    double start = 0,
    double end = 0,
    double vertical = 0,
  }) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return EdgeInsets.only(
      left: isRTL ? end.w : start.w,
      right: isRTL ? start.w : end.w,
      top: vertical.h,
      bottom: vertical.h,
    );
  }
}

/// Token-based EdgeInsets for semantic meaning
class EdgeInsetsToken {
  // Content spacing
  static EdgeInsets get contentPadding => EdgeInsets.all(16.r);
  static EdgeInsets get contentPaddingLarge => EdgeInsets.all(24.r);
  static EdgeInsets get contentPaddingSmall => EdgeInsets.all(12.r);

  // List spacing
  static EdgeInsets get listItemPadding => EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      );
  static EdgeInsets get listSeparatorPadding => EdgeInsets.symmetric(
        horizontal: 16.w,
      );

  // Form spacing
  static EdgeInsets get formFieldPadding => EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      );
  static EdgeInsets get formGroupPadding => EdgeInsets.only(bottom: 24.h);

  // Card spacing
  static EdgeInsets get cardPadding => EdgeInsets.all(16.r);
  static EdgeInsets get cardContentPadding => EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      );

  // Dialog spacing
  static EdgeInsets get dialogPadding => EdgeInsets.all(24.r);
  static EdgeInsets get dialogContentPadding => EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      );

  // Bottom sheet spacing
  static EdgeInsets get bottomSheetPadding => EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 32.h,
        top: 8.h,
      );

  // Safe area padding
  static EdgeInsets safeAreaPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return EdgeInsets.only(
      top: mediaQuery.padding.top,
      bottom: mediaQuery.padding.bottom,
    );
  }
}
