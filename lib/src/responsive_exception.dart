part of 'package:responsive/responsive.dart';

/// A custom exception that is thrown when an error occurs in the Responsive package.
class ResponsiveException implements Exception {
  /// The error message that is thrown when an error occurs.
  final String message;

  ///Creates a new instance of the ResponsiveException class.
  ResponsiveException(this.message);

  /// Returns the error message.
  @override
  String toString() => message;
}
