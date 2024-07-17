import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

/// [RowColumn] A widget that allows you to build a row or column based on the screen size.
/// [rowCrossAxisAlignment] The alignment of the children along the cross axis in a row.
/// [rowMainAxisAlignment] The alignment of the children along the main axis in a row.
/// [rowMainAxisSize] How much space should be occupied in the main axis.
/// [rowTextBaseline] A horizontal line used for aligning text.
/// [rowTextDirection] The reading order of the children in a row.
/// [rowVerticalDirection] The direction in which the children are placed in a row.
/// [colCrossAxisAlignment] The alignment of the children along the cross axis in a column.
/// [colMainAxisAlignment] The alignment of the children along the main axis in a column.
/// [colMainAxisSize] How much space should be occupied in the main axis.
/// [colTextBaseline] A horizontal line used for aligning text.
/// [colTextDirection] The reading order of the children in a column.
/// [colVerticalDirection] The direction in which the children are placed in a column.
/// [columnToRow] If true the widget will build a column instead of a row.
/// [matchTabletToDesktop] If true the widget will match the tablet to the desktop.
/// [customBreakpoint] A custom breakpoint that will be used to determine the layout.
/// [animationDuration] The duration of the animation.
/// [borderRadius] The radius of the border.
/// [backgroundColor] The color of the background.
/// [elevation] The elevation of the widget.
/// [padding] The padding of the widget.
/// [margin] The margin of the widget.
/// [shadowColor] The color of the shadow.
/// [shape] The shape of the widget.
/// [surfaceTintColor] The color of the surface.
/// [textStyle] The style of the text.
/// [materialType] The type of material.
/// [children] The children to be built in the row or column.
/// [width] The width of the widget.
/// [height] The height of the widget.
/// [reverseChildren] If true the children will be reversed.
/* 
A widget that allows you to build a row or column based on the screen size.
It also offers a way to build a row or column based on a custom breakpoint.
The widget itself has many properties that allow you to customize the row or column.
Applying a background, elevation, padding, margin, and more.

The row and column can each have their own unique properties. Such as CrossAxisAlignment,
MainAxisAlignment, MainAxisSize, TextBaseline, TextDirection, and VerticalDirection.
So when the screen changes the layout of the chidren will be changed accordingly.

The widget also allows you to reverse the order of the children in the row or column.
If there is ever a reason or need to do so.

The widget itself is wrapped in a LayoutBuilder widget so their is no need to wrap it in one.
Their is also no need to wrap the widget in a Responsive widget. As the widget itself is responsive.

@author IFD
@since 2024/07/17
*/
class RowColumn extends StatelessWidget {
  final CrossAxisAlignment? rowCrossAxisAlignment;
  final MainAxisAlignment? rowMainAxisAlignment;
  final MainAxisSize? rowMainAxisSize;
  final TextBaseline? rowTextBaseline;
  final TextDirection? rowTextDirection;
  final VerticalDirection? rowVerticalDirection;
  final CrossAxisAlignment? colCrossAxisAlignment;
  final MainAxisAlignment? colMainAxisAlignment;
  final MainAxisSize? colMainAxisSize;
  final TextBaseline? colTextBaseline;
  final TextDirection? colTextDirection;
  final VerticalDirection? colVerticalDirection;
  final bool? columnToRow;
  final bool? matchTabletToDesktop;
  final double? customBreakpoint;
  final Duration? animationDuration;
  final double? borderRadius;
  final Color? backgroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final TextStyle? textStyle;
  final MaterialType? materialType;
  final List<Widget> Function(BuildContext context, BoxConstraints constraints) children;
  final double? width;
  final double? height;
  final bool? reverseChildren;
  const RowColumn({
    super.key,
    this.columnToRow,
    this.matchTabletToDesktop,
    this.customBreakpoint,
    required this.children,
    this.rowCrossAxisAlignment,
    this.rowMainAxisAlignment,
    this.rowMainAxisSize,
    this.colCrossAxisAlignment,
    this.colMainAxisAlignment,
    this.colMainAxisSize,
    this.rowTextBaseline,
    this.colTextBaseline,
    this.rowTextDirection,
    this.colTextDirection,
    this.rowVerticalDirection,
    this.colVerticalDirection,
    this.borderRadius,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.animationDuration,
    this.surfaceTintColor,
    this.textStyle,
    this.materialType,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.reverseChildren,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //Check if a custom breakpoint has been assigned
        if (customBreakpoint != null && customBreakpoint! >= ResponsiveUtil.width) {
          return columnToRow != true ? column() : row();
        } else {
          switch (ResponsiveUtil.screenType) {
            case ScreenType.mobile:
              return columnToRow != true ? column() : row();
            case ScreenType.tablet:
              if (matchTabletToDesktop == true) {
                return columnToRow != true ? row() : column();
              } else {
                return columnToRow != true ? column() : row();
              }
            case ScreenType.desktop:
              return columnToRow != true ? row() : column();
          }
        }
      },
    );
  }

  Widget styleWrap({required Widget child}) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Material(
        animationDuration: animationDuration ?? Duration.zero,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        color: backgroundColor,
        elevation: elevation ?? 0,
        shadowColor: shadowColor,
        shape: shape,
        surfaceTintColor: surfaceTintColor,
        textStyle: textStyle,
        type: materialType ?? MaterialType.canvas,
        child: Container(
          padding: padding,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return child;
            },
          ),
        ),
      ),
    );
  }

  Widget row() {
    return styleWrap(
      child: LayoutBuilder(builder: (context, constraints) {
        // Build the list of widgets before providing it to its parent
        final List<Widget> builder = reverseChildren == true ? children(context, constraints).reversed.toList() : children(context, constraints);

        return Row(
          crossAxisAlignment: rowCrossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisAlignment: rowMainAxisAlignment ?? MainAxisAlignment.start,
          mainAxisSize: rowMainAxisSize ?? MainAxisSize.max,
          textBaseline: rowTextBaseline,
          textDirection: rowTextDirection,
          verticalDirection: rowVerticalDirection ?? VerticalDirection.down,
          children: builder, // Use the built list here
        );
      }),
    );
  }

  Widget column() {
    return styleWrap(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Build the list of widgets before providing it to its parent
          final List<Widget> builder = reverseChildren == true ? children(context, constraints).reversed.toList() : children(context, constraints);
          return Column(
            crossAxisAlignment: colCrossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisAlignment: colMainAxisAlignment ?? MainAxisAlignment.start,
            mainAxisSize: colMainAxisSize ?? MainAxisSize.max,
            textBaseline: colTextBaseline,
            textDirection: colTextDirection,
            verticalDirection: colVerticalDirection ?? VerticalDirection.down,
            children: builder,
          );
        },
      ),
    );
  }
}
