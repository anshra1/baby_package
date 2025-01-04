import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  TextTheme get textStyle => theme.textTheme;

  //
  EdgeInsets get padding => mediaQuery.padding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  Orientation get orientation => mediaQuery.orientation;

  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  // primary color
  Color get colorPrimary => theme.colorScheme.primary;
  Color get colorPrimaryBackground => theme.colorScheme.onPrimary;

  // Text Colors
  Color get colorTextPrimary => theme.colorScheme.onSurface;
  Color get colorTextSecondary => theme.colorScheme.onSurfaceVariant;
  Color get colorTextDisabled =>
      theme.colorScheme.onSurface.withAlpha((0.38 * 255).toInt());
  Color get colorTextError => theme.colorScheme.error;
  Color get colorTextLink => theme.colorScheme.primary;
  Color get colorTextInverse => theme.colorScheme.onPrimary;

  // Background Colors
  Color get colorBackgroundMain => theme.colorScheme.surface;
  Color get colorBackgroundSecondary => theme.colorScheme.surfaceContainerHighest;
  Color get colorBackgroundCard => theme.colorScheme.surface;
  Color get colorBackgroundModal => theme.colorScheme.surface;
  Color get colorBackgroundElevated => theme.colorScheme.surface;

  // Button Colors
  Color get colorButtonPrimaryBg => theme.colorScheme.primary;
  Color get colorButtonPrimaryText => theme.colorScheme.onPrimary;
  Color get colorButtonSecondaryBg => theme.colorScheme.secondary;
  Color get colorButtonSecondaryText => theme.colorScheme.onSecondary;
  Color get colorButtonOutlineBorder => theme.colorScheme.outline;
  Color get colorButtonDisabled =>
      theme.colorScheme.onSurface.withAlpha((0.12 * 255).toInt());

  // Icon Colors
  Color get colorIconPrimary => theme.colorScheme.onSurface;
  Color get colorIconSecondary => theme.colorScheme.onSurfaceVariant;
  Color get colorIconInteractive => theme.colorScheme.primary;
  Color get colorIconDisabled =>
      theme.colorScheme.onSurface.withAlpha((0.38 * 255).toInt());
  Color get colorIconError => theme.colorScheme.error;

  // Border & Divider Colors
  Color get colorBorderDefault => theme.colorScheme.outline;
  Color get colorBorderFocus => theme.colorScheme.primary;
  Color get colorBorderError => theme.colorScheme.error;
  Color get colorDivider => theme.colorScheme.outlineVariant;

  // Input Field Colors
  Color get colorInputLabel => theme.colorScheme.onSurfaceVariant;
  Color get colorInputText => theme.colorScheme.onSurface;
  Color get colorInputHelper => theme.colorScheme.onSurfaceVariant;
  Color get colorInputError => theme.colorScheme.error;
  Color get colorInputFilled => theme.colorScheme.surfaceContainerHighest;

  // State Colors
  Color get colorStateError => theme.colorScheme.error;
  Color get colorStateSuccess => theme.colorScheme.primary;
  Color get colorStateWarning => theme.colorScheme.secondary;
  Color get colorStateInfo => theme.colorScheme.tertiary;

  // Navigation Colors
  Color get colorNavSelected => theme.colorScheme.primary;
  Color get colorNavUnselected => theme.colorScheme.onSurfaceVariant;
  Color get colorNavBackground => theme.colorScheme.surface;

  // Chip Colors
  Color get colorChipBackground => theme.colorScheme.surfaceContainerHighest;
  Color get colorChipSelectedBg => theme.colorScheme.secondaryContainer;
  Color get colorChipText => theme.colorScheme.onSurfaceVariant;
  Color get colorChipSelectedText => theme.colorScheme.onSecondaryContainer;

  // Overlay Colors
  Color get colorOverlayModal => theme.colorScheme.scrim;
  Color get colorOverlayDisabled =>
      theme.colorScheme.onSurface.withAlpha((0.12 * 255).toInt());
  Color get colorOverlayPressed =>
      theme.colorScheme.primary.withAlpha((0.12 * 255).toInt());
  Color get colorOverlayHover =>
      theme.colorScheme.primary.withAlpha((0.08 * 255).toInt());
  Color get colorOverlayFocus =>
      theme.colorScheme.primary.withAlpha((0.12 * 255).toInt());

  // System Bar Colors
  Color get colorStatusBar => theme.colorScheme.primary;
  Color get colorNavigationBar => theme.colorScheme.surface;
}
