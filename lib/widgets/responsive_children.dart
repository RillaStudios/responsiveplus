part of '../responsive.dart';

/// An enum that helps you to layout the direction of the children.
enum ResponsiveChildrenLayout { column, row, wrap }

/// A widget that helps you build responsive UIs for different screen sizes and orientations.
class ResponsiveChildren extends StatelessWidget {
  /// A widget that will make its children responsive, these children can be any
  /// widget you want including custom widgets. Avoid using if you already
  /// have the page wrapped in a ResponsiveBuilder widget.
  const ResponsiveChildren({
    super.key,
    required this.children,
    this.layout,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.textBaseline,
    this.textDirection,
    this.verticalDirection,
    this.wrapAlignment,
    this.clipBehavior,
    this.wrapCrossAxisAlignment,
    this.direction,
    this.runAlignment,
    this.runSpacing,
    this.spacing,
  });

  /// Provides a list of children to the responsive widget. (required)
  final List<Widget> Function(BuildContext context, BoxConstraints constraints) children;

  /// Provides a layout for the children. (optional)
  ///
  /// The default value is ResponsiveChildrenLayout.column.
  ///
  final ResponsiveChildrenLayout? layout;

  ///The default crossAxisAlignment for the children.
  ///
  ///The default value is CrossAxisAlignment.center.
  ///
  final CrossAxisAlignment? crossAxisAlignment;

  ///The default mainAxisAlignment for the children.
  ///
  ///The default value is MainAxisAlignment.start.
  ///
  final MainAxisAlignment? mainAxisAlignment;

  ///The default mainAxisSize for the children.
  ///
  ///The default value is MainAxisSize.max.
  ///
  final MainAxisSize? mainAxisSize;

  ///The default textBaseline for the children.
  ///
  ///The default value is null.
  ///
  final TextBaseline? textBaseline;

  ///The default textDirection for the children.
  ///
  ///The default value is null.
  ///
  final TextDirection? textDirection;

  ///The default verticalDirection for the children.
  ///
  ///The default value is null.
  ///
  final VerticalDirection? verticalDirection;

  ///The default wrapAlignment for the children (wrap only).
  ///
  ///The default value is WrapAlignment.start.
  ///
  final WrapAlignment? wrapAlignment;

  ///The default clipBehavior for the children (wrap only).
  ///
  ///The default value is Clip.none.
  ///
  final Clip? clipBehavior;

  ///The default wrapCrossAxisAlignment for the children (wrap only).
  ///
  ///The default value is WrapCrossAlignment.start.
  ///
  final WrapCrossAlignment? wrapCrossAxisAlignment;

  ///The default direction for the children (wrap only).
  ///
  ///The default value is Axis.horizontal.
  ///
  final Axis? direction;

  ///The default runAlignment for the children (wrap only).
  ///
  ///The default value is WrapAlignment.start.
  ///
  final WrapAlignment? runAlignment;

  ///The default runSpacing for the children (wrap only).
  ///
  ///The default value is 0.0.
  ///
  final double? runSpacing;

  ///The default spacing for the children (wrap only).
  ///
  ///The default value is 0.0.
  ///
  final double? spacing;

  ///The main build method of the ResponsiveChildren widget.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<Widget> builder = children(context, constraints);
        switch (layout) {
          case ResponsiveChildrenLayout.row:
            return Row(
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              textBaseline: textBaseline,
              textDirection: textDirection,
              verticalDirection: verticalDirection ?? VerticalDirection.down,
              children: builder,
            );
          case ResponsiveChildrenLayout.wrap:
            return Wrap(
              alignment: wrapAlignment ?? WrapAlignment.start,
              clipBehavior: clipBehavior ?? Clip.none,
              crossAxisAlignment: wrapCrossAxisAlignment ?? WrapCrossAlignment.start,
              direction: direction ?? Axis.horizontal,
              runAlignment: runAlignment ?? WrapAlignment.start,
              runSpacing: runSpacing ?? 0.0,
              spacing: spacing ?? 0.0,
              textDirection: textDirection,
              verticalDirection: verticalDirection ?? VerticalDirection.down,
              children: builder,
            );
          default:
            return Column(
              crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              textBaseline: textBaseline,
              textDirection: textDirection,
              verticalDirection: verticalDirection ?? VerticalDirection.down,
              children: builder,
            );
        }
      },
    );
  }
}
