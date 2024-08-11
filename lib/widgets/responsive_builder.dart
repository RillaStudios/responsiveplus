part of 'package:responsiveplus/responsive.dart';

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
/// @urmishtech TechnoUrmish, Urmish Patel
///
/// @author IFD
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
  const ResponsiveBuilder(
      {super.key, required this.builder, this.onScreenSizeChange});

  /// The builder function that takes three parameters: context, orientation, and screenType.
  final ResponsiveBuilderType builder;

  /// A function that is called when the screen size changes.
  /// The function takes four parameters: context, constraints, orientation, and screenType.
  /// The context parameter is the build context of the widget.
  /// The constraints parameter is the constraints of the widget.
  /// The orientation parameter is the orientation of the screen.
  /// The screenType parameter is the type of screen (mobile, tablet, desktop).
  ///
  /// This functions is optional.
  ///
  final Function(BuildContext? context, BoxConstraints? constraints,
      Orientation? orientation, ScreenType? screenType)? onScreenSizeChange;

  ///
  /// The build method of the Responsive widget.
  ///
  /// @param context The build context of the widget.
  /// @return The widget that is built based on the screen orientation and type.
  /// @author IFD
  /// @since 2024/07/17
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            ResponsiveUtil._updateScreenSize(context, constraints, orientation);

            onScreenSizeChange != null
                ? onScreenSizeChange!(context, constraints, orientation,
                    ResponsiveUtil._screenType)
                : null;

            return builder(
              context,
              constraints,
              ResponsiveUtil._orientation,
              ResponsiveUtil._screenType,
            );
          },
        );
      },
    );
  }
}
