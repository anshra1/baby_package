import 'package:gap/gap.dart';

extension SpacingExtension on num {
  Gap get gap => Gap(toDouble());

  // Semantic spacing
  Gap get vSpace => Gap(toDouble());
  Gap get hSpace => Gap(toDouble());
}
