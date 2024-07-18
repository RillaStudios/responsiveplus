import 'package:flutter/material.dart';

/// A widget that helps you build responsive UIs for different screen sizes and orientations.
class ResponsiveChild extends StatelessWidget {
  /// A widget that will make its child responsive, this child can be any
  /// widget you want including custom widgets. Avoid using if you already
  /// have the page wrapped in a ResponsiveBuilder widget.
  const ResponsiveChild({super.key, required this.child});

  /// Provides a child to the responsive widget. (required)
  final Widget child;

  ///The main build method of the ResponsiveChild widget.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return child;
      },
    );
  }
}
