part of 'responsive.dart';

extension ResponsiveExt on num {
  double get h => this * ResponsiveUtil.height / 100;

  double get w => this * ResponsiveUtil.width / 100;
}
