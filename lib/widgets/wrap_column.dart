import 'package:flutter/material.dart';
import 'package:responsive/responsive.dart';

/// A widget that will build a [Wrap] or [Column] based on the screen size.
///
///A widget that allows you to build a wrap or column based on the screen size.
///It also offers a way to build a wrap or column based on a custom breakpoint.
///The widget itself has many properties that allow you to customize the wrap or column.
///Applying a background, elevation, padding, margin, and more.
///
///The wrap and column can each have their own unique properties. As they do in the
///Flutter framework. So when the screen changes the layout of the chidren will
///be changed accordingly.

///The widget also allows you to reverse the order of the children in the wrap or column.
///If there is ever a reason or need to do so.

///The widget itself is wrapped in a LayoutBuilder widget so their is no need to wrap it in one.
///Their is also no need to wrap the widget in a Responsive widget. As the widget itself is responsive.
///
/// @author IFD
/// @since 2024/07/17
class WrapColumn extends StatelessWidget {
  /// Creates a [Wrap] or [Column] widget that will be built based on the screen size.
  ///
  const WrapColumn({
    super.key,
    required this.clipBehavior,
    this.wrapCrossAlignment,
    this.wrapAlignment,
    this.runAlignment,
    this.wrapAxis,
    this.wrapTextBaseline,
    this.wrapTextDirection,
    this.wrapVerticalDirection,
    this.wrapSpacing,
    this.runSpacing,
    this.colCrossAxisAlignment,
    this.colMainAxisAlignment,
    this.colMainAxisSize,
    this.colTextBaseline,
    this.colTextDirection,
    this.colVerticalDirection,
    this.columnToRow,
    this.matchTabletToDesktop,
    this.customBreakpoint,
    this.animationDuration,
    this.borderRadius,
    this.backgroundColor,
    this.elevation,
    this.padding,
    this.margin,
    this.shadowColor,
    this.shape,
    this.surfaceTintColor,
    this.textStyle,
    this.materialType,
    required this.children,
    this.width,
    this.height,
    this.reverseChildren,
  });

  /// The clip behavior of the children in a wrap.
  ///
  /// [Clip.none] will not clip the children.
  /// [Clip.hardEdge] will clip the children with a hard edge.
  /// [Clip.antiAlias] will clip the children with an anti-alias edge.
  /// [Clip.antiAliasWithSaveLayer] will clip the children with an anti-alias edge and save the layer.
  ///
  /// The default value is [Clip.none].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [clipBehavior: ResponsiveUtil.isTablet() ? Clip.hardEdge : Clip.none]
  final Clip clipBehavior;

  /// The alignment of the children along the cross axis in a wrap.
  ///
  /// This is basically considered the vertical alignment of the children in a wrap.
  ///
  /// [WrapCrossAlignment.start] will align the children at the top of the wrap.
  /// [WrapCrossAlignment.center] will align the children in the center of the wrap.
  /// [WrapCrossAlignment.end] will align the children at the bottom of the wrap.
  ///
  /// The default value is [WrapCrossAlignment.center].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapCrossAxisAlignment: ResponsiveUtil.isTablet() ? WrapCrossAlignment.center : WrapCrossAlignment.start]
  final WrapCrossAlignment? wrapCrossAlignment;

  /// The alignment of the children along the main axis in a wrap.
  ///
  /// This is basically considered the horizontal alignment of the children in a wrap.
  ///
  /// [WrapAlignment.start] will align the children at the start of the wrap.
  /// [WrapAlignment.center] will align the children in the center of the wrap.
  /// [WrapAlignment.end] will align the children at the end of the wrap.
  /// [WrapAlignment.spaceAround] will space the children evenly around the wrap.
  /// [WrapAlignment.spaceBetween] will space the children evenly between the wrap.
  /// [WrapAlignment.spaceEvenly] will space the children evenly in the wrap.
  ///
  /// The default value is [MainAxisAlignment.start].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapMainAlignment: ResponsiveUtil.isTablet() ? WrapAlignment.center : WrapAlignment.start]
  final WrapAlignment? wrapAlignment;

  /// The alignment of the children along the runs in a wrap.
  ///
  /// This is basically considered the horizontal alignment of the children in a wrap.
  ///
  /// [WrapAlignment.start] will align the children at the start of the wrap.
  /// [WrapAlignment.center] will align the children in the center of the wrap.
  /// [WrapAlignment.end] will align the children at the end of the wrap.
  /// [WrapAlignment.spaceAround] will space the children evenly around the wrap.
  /// [WrapAlignment.spaceBetween] will space the children evenly between the wrap.
  /// [WrapAlignment.spaceEvenly] will space the children evenly in the wrap.
  ///
  /// The default value is [MainAxisAlignment.start].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapMainAlignment: ResponsiveUtil.isTablet() ? WrapAlignment.center : WrapAlignment.start]
  final WrapAlignment? runAlignment;

  /// The axis along which the children will be placed in a wrap.
  ///
  /// [Axis.horizontal] will place the children in a row.
  /// [Axis.vertical] will place the children in a column.
  ///
  /// The default value is [Axis.horizontal].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapAxis: ResponsiveUtil.isTablet() ? Axis.horizontal : Axis.vertical]
  final Axis? wrapAxis;

  /// The text baseline to use for aligning text in a wrap.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapTextBaseline: ResponsiveUtil.isTablet() ? TextBaseline.alphabetic : TextBaseline.ideographic]
  final TextBaseline? wrapTextBaseline;

  /// The direction to use for text direction in a wrap.
  ///
  /// The default value is null.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapTextDirection: ResponsiveUtil.isTablet() ? TextDirection.rtl : TextDirection.ltr]
  final TextDirection? wrapTextDirection;

  /// The vertical direction to use for the children in a wrap.
  ///
  /// The default value is [VerticalDirection.down].
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapVerticalDirection: ResponsiveUtil.isTablet() ? VerticalDirection.up : VerticalDirection.down]
  final VerticalDirection? wrapVerticalDirection;

  /// The spacing between the children in a wrap.
  ///
  /// The default value is 0.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapSpacing: ResponsiveUtil.isTablet() ? 10.0 : 0.0]
  final double? wrapSpacing;

  /// The spacing between the runs of the children in a wrap.
  ///
  /// The default value is 0.
  ///
  /// Remember because this is a repsonsive widget you can set the alignment based
  /// on screen size for example [wrapRunSpacing: ResponsiveUtil.isTablet() ? 10.0 : null]
  final double? runSpacing;

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

  /// A custom breakpoint that allows you to set a custom breakpoint for the wrap or column.
  /// By default the breakpoint for converting a wrap to a column is 1024 (Tablet).
  final double? customBreakpoint;

  /// The duration of the animation when the material is being created, or changed.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [animationDuration] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is Duration.zero.
  final Duration? animationDuration;

  /// The radius of the border of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [borderRadius] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is 0.
  final double? borderRadius;

  /// The color of the background of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [backgroundColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? backgroundColor;

  /// The elevation of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [elevation] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is 0.
  final double? elevation;

  /// The padding of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [padding] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final EdgeInsetsGeometry? padding;

  /// The margin of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [margin] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final EdgeInsetsGeometry? margin;

  /// The shadow color of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [shadowColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? shadowColor;

  /// The shape of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [shape] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final ShapeBorder? shape;

  /// The surface tint color of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [surfaceTintColor] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final Color? surfaceTintColor;

  /// The text style of the Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [textStyle] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final TextStyle? textStyle;

  /// The type of Material widget that wraps the wrap or column.
  /// This is for the Material widget that wraps the wrap or column.
  ///
  /// * [materialType] Sole purpose is for design and not repsonsive functionality.
  ///
  /// The default value is null.
  final MaterialType? materialType;

  /// A list of widgets that will be built in the wrap or column.
  /// The list of widgets will be built inside the wrap or
  /// column based on the screen size.
  final List<Widget> Function(BuildContext context, BoxConstraints constraints) children;

  /// The width of the Material widget that wraps the wrap or column.
  /// This will set the width for the entire wrap or column.
  ///
  /// This does not need to be set but can be set if needed.
  ///
  /// The default value is null.
  final double? width;

  /// The height of the Material widget that wraps the wrap or column.
  /// This will set the height for the entire wrap or column.
  ///
  /// This does not need to be set but can be set if needed.
  ///
  /// The default value is null.
  final double? height;

  /// If set to true the children in the wrap or column will be reversed.
  /// This is useful if you need to reverse the order of the children.
  ///
  /// The default value is false.
  final bool? reverseChildren;

  /// The main build method for the widget
  ///
  /// @param context The current build context
  /// @return The built widget
  /// @since 2024/07/17
  /// @author IFD
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //Check if a custom breakpoint has been assigned
        if (customBreakpoint != null && customBreakpoint! >= ResponsiveUtil.width) {
          return columnToRow != true ? column() : wrap();
        } else {
          switch (ResponsiveUtil.screenType) {
            case ScreenType.mobile:
              return columnToRow != true ? column() : wrap();
            case ScreenType.tablet:
              if (matchTabletToDesktop == true) {
                return columnToRow != true ? wrap() : column();
              } else {
                return columnToRow != true ? column() : wrap();
              }
            case ScreenType.desktop:
              return columnToRow != true ? wrap() : column();
          }
        }
      },
    );
  }

  /// The styleWrap method is used to wrap the wrap or column in a Material widget
  ///
  /// @param child The child widget that will be wrapped in the Material widget
  /// @return The Material widget that wraps the wrap or column
  /// @since 2024/07/17
  /// @author IFD
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

  /// The wrap method is used to build a wrap widget
  ///
  /// @return The built wrap widget with the children inside it based on the screen size
  /// @author IFD
  /// @since 2024/07/17
  Widget wrap() {
    return styleWrap(
      child: LayoutBuilder(builder: (context, constraints) {
        // Build the list of widgets before providing it to its parent
        final List<Widget> builder = reverseChildren == true ? children(context, constraints).reversed.toList() : children(context, constraints);

        return Wrap(
          clipBehavior: clipBehavior,
          crossAxisAlignment: wrapCrossAlignment ?? WrapCrossAlignment.center,
          alignment: wrapAlignment ?? WrapAlignment.start,
          direction: wrapAxis ?? Axis.horizontal,
          runAlignment: runAlignment ?? WrapAlignment.start,
          textDirection: wrapTextDirection,
          verticalDirection: wrapVerticalDirection ?? VerticalDirection.down,
          spacing: wrapSpacing ?? 0.0,
          runSpacing: runSpacing ?? 0.0,
          children: builder, // Use the built list here
        );
      }),
    );
  }

  /// The column method is used to build a column widget
  ///
  /// @return The built column widget with the children inside it based on the screen size
  /// @author IFD
  /// @since 2024/07/17
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
