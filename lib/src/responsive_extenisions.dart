part of 'package:responsiveplus/responsive.dart';

///Extension for responsive values
///
extension ResponsiveExt on num {
  ///Converts the number to a responsive height value
  ///
  ///The value is calculated by multiplying the number by the height of the screen and dividing by 100
  ///Example: 10.h will return 10% of the height of the screen
  double get h => this * ResponsiveUtil._height / 100;

  ///Converts the number to a responsive width value
  ///
  ///The value is calculated by multiplying the number by the width of the screen and dividing by 100
  ///Example: 10.w will return 10% of the width of the screen
  double get w => this * ResponsiveUtil._width / 100;

  ///Converts the number to a responsive scalable pixel value
  ///
  ///The value is calculated by multiplying the number by the width of the screen and dividing by 3 divided by 100
  ///Example: 10.sp will return 10% of the width of the screen divided by 3 divided by 100
  double get sp => this * (ResponsiveUtil._width / 3) / 100;

  ///Converts the number to a responsive width value based on the constraints
  ///of the parent widget
  ///
  ///The value is calculated by multiplying the number by the maximum width of the constraints and dividing by 100
  double cw(BoxConstraints constraints) => this * constraints.maxWidth / 100;

  ///Converts the number to a responsive height value based on the constraints
  ///of the parent widget
  ///
  ///The value is calculated by multiplying the number by the maximum height of the constraints and dividing by 100
  double ch(BoxConstraints constraints) => this * constraints.maxHeight / 100;

  ///Converts the number to a responsive width value based on the users physical screen width
  double get dw => this * ResponsiveUtil._displayWidth / 100;

  ///Converts the number to a responsive width value based on the users physical screen height
  double get dh => this * ResponsiveUtil._displayHeight / 100;
}
