part of 'package:responsive/responsive.dart';

///Extension for responsive values
///
extension ResponsiveExt on num {
  ///Converts the number to a responsive height value
  ///
  ///The value is calculated by multiplying the number by the height of the screen and dividing by 100
  ///Example: 10.h will return 10% of the height of the screen
  double get h => this * ResponsiveUtil.height / 100;

  ///Converts the number to a responsive width value
  ///
  ///The value is calculated by multiplying the number by the width of the screen and dividing by 100
  ///Example: 10.w will return 10% of the width of the screen
  double get w => this * ResponsiveUtil.width / 100;

  ///Converts the number to a responsive scalable pixel value
  ///
  ///The value is calculated by multiplying the number by the width of the screen and dividing by 3 divided by 100
  ///Example: 10.sp will return 10% of the width of the screen divided by 3 divided by 100
  double get sp => this * (ResponsiveUtil.width / 3) / 100;
}
