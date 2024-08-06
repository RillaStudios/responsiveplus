part of 'package:responsiveplus/responsive.dart';

/// A widget that helps you build responsive UIs for different screen sizes and orientations.
class ResponsiveChild extends StatelessWidget {
  /// A widget that will make its child responsive, this child can be any
  /// widget you want including custom widgets. Avoid using if you already
  /// have the page wrapped in a ResponsiveBuilder widget.
  const ResponsiveChild({super.key, required this.child, this.onScreenSizeChanged});

  /// Performs an action when the screen size is changed.
  ///
  /// This is optional and defaults to null.
  final Function(BoxConstraints constraints)? onScreenSizeChanged;

  /// Provides a child to the responsive widget. (required)
  final Widget Function(BuildContext context, BoxConstraints constraints) child;

  ///The main build method of the ResponsiveChild widget.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        onScreenSizeChanged?.call(constraints);

        return child(context, constraints);
      },
    );
  }
}
