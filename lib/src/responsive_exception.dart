part of 'package:responsive/responsive.dart';

class ResponsiveException implements Exception {
  final String message;

  ResponsiveException(this.message);

  @override
  String toString() => message;
}
