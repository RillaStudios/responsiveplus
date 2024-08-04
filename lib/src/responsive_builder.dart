part of 'package:responsive/responsive.dart';

/// This is a functional widget that takes a builder function
/// as a parameter and returns a widget. The builder function
/// takes three parameters: context, orientation, and screenType.
/// The context parameter is the build context of the widget.
/// The orientation parameter is the orientation of the screen.
/// The screenType parameter is the type of screen (mobile, tablet, desktop).
/// The builder function returns a widget that is built based on the
/// screen orientation and type.
///
/// Note that the builder function is inspired by the Sizer package,
/// published by TechnoUrmish, Urmish Patel on pub.dev.
///
/// @author IFD
/// @urmishtech TechnoUrmish, Urmish Patel
/// @since 2024/07/17
typedef ResponsiveBuilderType = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  Orientation orientation,
  ScreenType screenType,
);

/// A widget that helps you build responsive UIs for different screen sizes and orientations.
/// It takes a builder function as a parameter and returns a widget you provide.
class ResponsiveBuilder extends StatelessWidget {
  /// Creates a Responsive widget.
  ///
  const ResponsiveBuilder({super.key, required this.builder});

  /// The builder function that takes three parameters: context, orientation, and screenType.
  final ResponsiveBuilderType builder;

  ///
  /// The build method of the Responsive widget.
  ///
  /// @param context The build context of the widget.
  /// @return The widget that is built based on the screen orientation and type.
  /// @urmishtech TechnoUrmish, Urmish Patel
  /// @author IFD
  /// @since 2024/07/17
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            ResponsiveUtil.updateScreenSize(constraints, orientation);
            return builder(
              context,
              constraints,
              ResponsiveUtil.orientation,
              ResponsiveUtil.screenType,
            );
          },
        );
      },
    );
  }
}
