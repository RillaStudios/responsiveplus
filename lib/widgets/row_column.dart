import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

/// A widget that allows you to build a row or column based on the screen size.
///
///A widget that allows you to build a row or column based on the screen size.
///It also offers a way to build a row or column based on a custom breakpoint.
///The widget itself has many properties that allow you to customize the row or column.
///Applying a background, elevation, padding, margin, and more.
///
///The row and column can each have their own unique properties. Such as CrossAxisAlignment,
///MainAxisAlignment, MainAxisSize, TextBaseline, TextDirection, and VerticalDirection.
///So when the screen changes the layout of the chidren will be changed accordingly.

///The widget also allows you to reverse the order of the children in the row or column.
///If there is ever a reason or need to do so.

///The widget itself is wrapped in a LayoutBuilder widget so their is no need to wrap it in one.
///Their is also no need to wrap the widget in a Responsive widget. As the widget itself is responsive.
///
/// @author IFD
/// @since 2024/07/17
class RowColumn extends StatelessWidget {
  ///Creates a widget that allows you to build a [Row] or [Column] based on the screen size.
  ///
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

  /// The alignment of the children along the cross axis in a row.
  ///
  /// This is basically considered the vertical alignment of the children in a row.
  ///
  /// [CrossAxisAlignment.start] will align the children at the top of the row.
  /// [CrossAxisAlignment.center] will align the children in the center of the row.
  /// [CrossAxisAlignment.end] will align the children at the bottom of the row.
  /// [CrossAxisAlignment.stretch] will stretch the children to fit the row.
  /// [CrossAxisAlignment.baseline] will align the children at the baseline of the row.
  ///
  /// The default value is [CrossAxisAlignment.center].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowCrossAxisAlignment: ResponsiveUtil.isTablet() ? CrossAxisAlignment.center : CrossAxisAlignment.start]
  final CrossAxisAlignment? rowCrossAxisAlignment;

  /// The alignment of the children along the main axis in a row.
  ///
  /// This is basically considered the horizontal alignment of the children in a row.
  ///
  /// [MainAxisAlignment.start] will align the children at the start of the row.
  /// [MainAxisAlignment.center] will align the children in the center of the row.
  /// [MainAxisAlignment.end] will align the children at the end of the row.
  /// [MainAxisAlignment.spaceAround] will space the children evenly around the row.
  /// [MainAxisAlignment.spaceBetween] will space the children evenly between the row.
  /// [MainAxisAlignment.spaceEvenly] will space the children evenly in the row.
  ///
  /// The default value is [MainAxisAlignment.start].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowMainAxisAlignment: ResponsiveUtil.isTablet() ? MainAxisAlignment.center : MainAxisAlignment.start]
  final MainAxisAlignment? rowMainAxisAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// [MainAxisSize.min] will take up the minimum amount of space.
  /// [MainAxisSize.max] will take up the maximum amount of space.
  ///
  /// The default value is [MainAxisSize.max].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowMainAxisSize: ResponsiveUtil.isTablet() ? MainAxisSize.min : MainAxisSize.max]
  final MainAxisSize? rowMainAxisSize;

  /// The text baseline to use for aligning text in a row.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowTextBaseline: ResponsiveUtil.isTablet() ? TextBaseline.alphabetic : TextBaseline.ideographic]
  final TextBaseline? rowTextBaseline;

  /// The direction to use for text direction in a row.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowTextDirection: ResponsiveUtil.isTablet() ? TextDirection.rtl : TextDirection.ltr]
  final TextDirection? rowTextDirection;

  /// The vertical direction to use for the children in a row.
  ///
  /// The default value is [VerticalDirection.down].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [rowVerticalDirection: ResponsiveUtil.isTablet() ? VerticalDirection.up : VerticalDirection.down]
  final VerticalDirection? rowVerticalDirection;

  /// The alignment of the children along the cross axis in a column.
  ///
  /// This is basically considered the horizontal alignment of the children in a column.
  ///
  /// [CrossAxisAlignment.start] will align the children at the start of the column.
  /// [CrossAxisAlignment.center] will align the children in the center of the column.
  /// [CrossAxisAlignment.end] will align the children at the end of the column.
  /// [CrossAxisAlignment.stretch] will stretch the children to fit the column.
  /// [CrossAxisAlignment.baseline] will align the children at the baseline of the column.
  ///
  /// The default value is [CrossAxisAlignment.center].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colCrossAxisAlignment: ResponsiveUtil.isTablet() ? CrossAxisAlignment.center : CrossAxisAlignment.start]
  final CrossAxisAlignment? colCrossAxisAlignment;

  /// The alignment of the children along the main axis in a column.
  ///
  /// This is basically considered the vertical alignment of the children in a column.
  ///
  /// [MainAxisAlignment.start] will align the children at the top of the column.
  /// [MainAxisAlignment.center] will align the children in the center of the column.
  /// [MainAxisAlignment.end] will align the children at the bottom of the column.
  /// [MainAxisAlignment.spaceAround] will space the children evenly around the column.
  /// [MainAxisAlignment.spaceBetween] will space the children evenly between the column.
  /// [MainAxisAlignment.spaceEvenly] will space the children evenly in the column.
  ///
  /// The default value is [MainAxisAlignment.start].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colMainAxisAlignment: ResponsiveUtil.isTablet() ? MainAxisAlignment.center : MainAxisAlignment.start]
  final MainAxisAlignment? colMainAxisAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// [MainAxisSize.min] will take up the minimum amount of space.
  /// [MainAxisSize.max] will take up the maximum amount of space.
  ///
  /// The default value is [MainAxisSize.max].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colMainAxisSize: ResponsiveUtil.isTablet() ? MainAxisSize.min : MainAxisSize.max]
  final MainAxisSize? colMainAxisSize;

  /// The text baseline to use for aligning text in a column.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colTextBaseline: ResponsiveUtil.isTablet() ? TextBaseline.alphabetic : TextBaseline.ideographic]
  final TextBaseline? colTextBaseline;

  /// The direction to use for text direction in a column.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colTextDirection: ResponsiveUtil.isTablet() ? TextDirection.rtl : TextDirection.ltr]
  final TextDirection? colTextDirection;

  /// The vertical direction to use for the children in a column.
  ///
  /// The default value is [VerticalDirection.down].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [colVerticalDirection: ResponsiveUtil.isTablet() ? VerticalDirection.up : VerticalDirection.down]
  final VerticalDirection? colVerticalDirection;

  /// By default when the screen is Desktop the children will be in a [Row], and Tablet
  /// and Mobile will be in a [Column] This property allows you to change that behavior.
  ///
  /// If set to true the children will be in a [Column] when the screen is Desktop and
  /// in a [Row] when the screen is Tablet or Mobile.
  final bool? columnToRow;

  /// By default tablet views will match with mobile, meaning that if the screen is a tablet
  /// it will return a [Column]. When [matchTabletToDesktop] is set to true the tablet view
  /// will match the desktop view and return a [Row]. Unless the [columnToRow] property is set to true.
  /// Then the tablet view will return a [Column].
  final bool? matchTabletToDesktop;

  /// A custom breakpoint that allows you to set a custom breakpoint for the row or column.
  /// By default the breakpoint for converting a row to a column is 1024 (Tablet).
  final double? customBreakpoint;

  /// The duration of the animation when the material is being created, or changed.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [animationDuration] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is Duration.zero.
  final Duration? animationDuration;

  /// The radius of the border of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [borderRadius] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is 0.
  final double? borderRadius;

  /// The color of the background of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [backgroundColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? backgroundColor;

  /// The elevation of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [elevation] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is 0.
  final double? elevation;

  /// The padding of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [padding] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final EdgeInsetsGeometry? padding;

  /// The margin of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [margin] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final EdgeInsetsGeometry? margin;

  /// The shadow color of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [shadowColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? shadowColor;

  /// The shape of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [shape] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final ShapeBorder? shape;

  /// The surface tint color of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [surfaceTintColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? surfaceTintColor;

  /// The text style of the Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [textStyle] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final TextStyle? textStyle;

  /// The type of Material widget that wraps the row or column.
  /// This is for the Material widget that wraps the row or column.
  ///
  /// * [materialType] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final MaterialType? materialType;

  /// A list of widgets that will be built in the row or column.
  /// The list of widgets will be built inside the row or
  /// column based on the screen size.
  final List<Widget> Function(BuildContext context, BoxConstraints constraints) children;

  /// The width of the Material widget that wraps the row or column.
  /// This will set the width for the entire row or column.
  ///
  /// This does not need to be set but can be set if needed.
  ///
  /// The default value is null.
  final double? width;

  /// The height of the Material widget that wraps the row or column.
  /// This will set the height for the entire row or column.
  ///
  /// This does not need to be set but can be set if needed.
  ///
  /// The default value is null.
  final double? height;

  /// If set to true the children in the row or column will be reversed.
  /// This is useful if you need to reverse the order of the children.
  ///
  /// The default value is false.
  final bool? reverseChildren;

  /* 
  The main build method for the widget

  @param context The current build context
  @return The built widget
  @author IFD
  @since 2024/07/17
  */
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

  /* 
  The styleWrap method is used to wrap the row or column in a Material widget

  @param child The child widget that will be wrapped in the Material widget
  @return The Material widget that wraps the row or column
  @author IFD
  @since 2024/07/17
  */
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

  /* 
  The row method is used to build a row widget

  @return The built row widget with the children inside it based on the screen size
  @author IFD
  @since 2024/07/17
  */
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

  /* 
  The column method is used to build a column widget
  
  @return The built column widget with the children inside it based on the screen size
  @author IFD
  @since 2024/07/17
  */
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
