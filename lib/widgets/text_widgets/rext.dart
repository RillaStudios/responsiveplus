part of 'package:responsiveplus/responsive.dart';

///
/// A widget that will make text responsive
/// Has the ability to group multiple [Rext]
/// widgets using [group] parameter and
/// calculate the biggest font size that
/// will fit all of them.
///
class Rext extends StatefulWidget {
  ///
  /// A widget that will make text responsive
  /// Has the ability to group multiple [Rext]
  /// widgets using [RextGroup] parameter and
  /// calculate the biggest font size that
  /// will fit all of them.
  ///
  const Rext(
    ///Creates a [Rext] widget with a [Text] widget
    ///as its child. This is the simplest way to
    ///create a [Rext] widget.
    String this.data, {
    super.key,
    this.textKey,
    this.adjustmentSize,
    this.locale,
    this.fontSize,
    this.maxFontSize,
    this.minFontSize,
    this.maxLines,
    this.overflow,
    this.rextGroup,
    this.presetFontSizes,
    this.selectionColor,
    this.semanticsLabel,
    this.strutStyle,
    this.style,
    this.softWrap,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.showDefaultOverflowWidget = false,
  })  : textSpan = null,
        autofocus = null,
        contextMenuBuilder = null,
        cursorColor = null,
        cursorHeight = null,
        cursorRadius = null,
        cursorWidth = null,
        dragStartBehavior = null,
        enableInteractiveSelection = null,
        focusNode = null,
        magnifierConfiguration = null,
        minLines = null,
        onSelectionChanged = null,
        onTap = null,
        scrollPhysics = null,
        selectionControls = null,
        selectionHeightStyle = null,
        selectionWidthStyle = null,
        showCursor = null,
        useDefaultContextMenuOnWeb = false,
        _isSelectable = false;

  /// Creates a [Rext] widget with a [TextSpan]
  /// as its child. The [TextSpan] can contain
  /// multiple styles and text. This is useful
  /// when you need to style different parts
  /// of the text differently. You can also
  /// apply the [RextGroup] to this widget.
  ///
  const Rext.rich(
    TextSpan this.textSpan, {
    super.key,
    this.textKey,
    this.fontSize,
    this.adjustmentSize,
    this.locale,
    this.maxFontSize,
    this.minFontSize,
    this.maxLines,
    this.overflow,
    this.presetFontSizes,
    this.rextGroup,
    this.selectionColor,
    this.semanticsLabel,
    this.strutStyle,
    this.style,
    this.softWrap,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.showDefaultOverflowWidget = false,
  })  : data = null,
        autofocus = null,
        contextMenuBuilder = null,
        cursorColor = null,
        cursorHeight = null,
        cursorRadius = null,
        cursorWidth = null,
        dragStartBehavior = null,
        enableInteractiveSelection = null,
        focusNode = null,
        magnifierConfiguration = null,
        minLines = null,
        onSelectionChanged = null,
        onTap = null,
        scrollPhysics = null,
        selectionControls = null,
        selectionHeightStyle = null,
        selectionWidthStyle = null,
        showCursor = null,
        useDefaultContextMenuOnWeb = false,
        _isSelectable = false;

  /// Creates a [Rext] widget with a [SelectableText] widget
  /// as its child. This is useful when you need to make
  /// the text selectable. You can also apply the [RextGroup]
  /// to this widget.
  const Rext.selectable(
    String this.data, {
    super.key,
    this.textKey,
    this.adjustmentSize,
    this.locale,
    this.fontSize,
    this.maxFontSize,
    this.minFontSize,
    this.maxLines,
    this.overflow,
    this.rextGroup,
    this.presetFontSizes,
    this.selectionColor,
    this.semanticsLabel,
    this.strutStyle,
    this.style,
    this.softWrap,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.showDefaultOverflowWidget = false,
    this.autofocus,
    this.contextMenuBuilder,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth,
    this.dragStartBehavior,
    this.enableInteractiveSelection,
    this.focusNode,
    this.magnifierConfiguration,
    this.minLines,
    this.onSelectionChanged,
    this.onTap,
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.showCursor,
    this.useDefaultContextMenuOnWeb = false,
  })  : textSpan = null,
        _isSelectable = true;

  /// Creates a [Rext] widget with a [SelectableText.rich] as
  /// its child. This is useful when you need to make the text
  /// selectable and style different parts of the text differently.
  /// You can also apply the [RextGroup] to this widget.
  const Rext.selectableRich(
    TextSpan this.textSpan, {
    super.key,
    this.textKey,
    this.fontSize,
    this.adjustmentSize,
    this.locale,
    this.maxFontSize,
    this.minFontSize,
    this.maxLines,
    this.overflow,
    this.presetFontSizes,
    this.rextGroup,
    this.selectionColor,
    this.semanticsLabel,
    this.strutStyle,
    this.style,
    this.softWrap,
    this.textAlign,
    this.textDirection,
    this.textHeightBehavior,
    this.textScaler,
    this.textWidthBasis,
    this.showDefaultOverflowWidget = false,
    this.autofocus,
    this.contextMenuBuilder,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth,
    this.dragStartBehavior,
    this.enableInteractiveSelection,
    this.focusNode,
    this.magnifierConfiguration,
    this.minLines,
    this.onSelectionChanged,
    this.onTap,
    this.scrollPhysics,
    this.selectionControls,
    this.selectionHeightStyle,
    this.selectionWidthStyle,
    this.showCursor,
    this.useDefaultContextMenuOnWeb = false,
  })  : data = null,
        _isSelectable = true;

  /// The key to use for the text widget
  /// created by this widget
  final Key? textKey;

  /// The text to display
  ///
  final String? data;

  /// The font size of the text
  ///
  /// If not provided, the default
  /// font size will be 14
  ///
  final double? fontSize;

  /// The amount to adjust the font size
  /// when calculating the responsive
  /// font size
  ///
  /// If not provided, the default
  /// adjustment size will be 0.5
  ///
  final double? adjustmentSize;

  /// The [TextSpan] to display
  /// instead of the [data] when
  /// [Rext.rich] is used
  final TextSpan? textSpan;

  /// The locale to use for the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// locale will be null
  ///
  final Locale? locale;

  /// The maximum font size of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// maximum font size will be double.infinity
  final double? maxFontSize;

  /// The minimum font size of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// minimum font size will be 8
  ///
  final double? minFontSize;

  /// The maximum number of lines
  /// to display
  ///
  /// If not provided, the default
  /// maximum number of lines will be null (no limit)
  ///
  final int? maxLines;

  /// The overflow behavior of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// overflow behavior will be TextOverflow.clip
  ///
  final TextOverflow? overflow;

  /// The list of preset font sizes
  /// to use when calculating the
  /// responsive font size. It will
  /// automatically sort the list
  /// from biggest to smallest.
  ///
  /// If not provided, the default
  /// preset font sizes will be null
  ///
  final List<double>? presetFontSizes;

  /// The [RextGroup] to use when
  /// calculating the responsive font
  /// size
  ///
  /// If not provided, the default
  /// [RextGroup] will be null
  ///
  final RextGroup? rextGroup;

  /// The color to use for the text
  /// selection
  ///
  /// If not provided, the default
  /// selection color will be null
  ///
  final Color? selectionColor;

  /// The semantics label to use for
  /// the text created by this widget
  ///
  /// If not provided, the default
  /// semantics label will be null
  final String? semanticsLabel;

  /// The strut style to use for the
  /// text created by this widget
  ///
  /// If not provided, the default
  /// strut style will be null
  ///
  final StrutStyle? strutStyle;

  /// The style to use for the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// style will be [DefaultTextStyle]
  final TextStyle? style;

  /// Whether the text should break
  /// at soft line breaks
  ///
  /// If not provided, the default
  /// value will be true
  ///
  final bool? softWrap;

  /// The alignment of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// alignment will be [TextAlign.start]
  ///
  final TextAlign? textAlign;

  /// The direction of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// direction will be [TextDirection.ltr]
  ///
  final TextDirection? textDirection;

  /// The height behavior of the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// height behavior will be null
  ///
  final TextHeightBehavior? textHeightBehavior;

  /// The scaler to use for the text
  /// created by this widget
  ///
  /// If not provided, the default
  /// scaler will be [TextScaler.noScaling]
  ///
  final TextScaler? textScaler;

  /// The width basis to use for the
  /// text created by this widget
  ///
  /// If not provided, the default
  /// width basis will be null
  ///
  final TextWidthBasis? textWidthBasis;

  /// The default overflow widget to use
  /// when the text does not fit the
  /// constraints of the parent widget
  ///
  /// If not provided, the default overflow
  /// will be the text with standard overflow
  /// behavior
  final bool showDefaultOverflowWidget;

  ///
  ///
  /// List of all the variable parameters for
  /// the selectables [Rext] widgets
  ///
  ///

  ///Determines weather the text is selectable
  ///
  final bool _isSelectable;

  ///Determines weather or not to show the prebuilt context menu
  ///on web platforms. If set to false, the default context menu
  ///will be shown as provided by the clients web browser.
  ///
  ///If not provided, the default value will be false
  ///
  final bool useDefaultContextMenuOnWeb;

  /// The autofocus of the text when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default autofocus
  /// will be false
  ///
  final bool? autofocus;

  /// The context menu builder for the
  /// text created by this widget
  /// when the [Rext] is selectable
  ///
  /// If not provided, the default
  /// context menu builder will be null
  ///
  final Widget Function(BuildContext context, EditableTextState editableTextState)? contextMenuBuilder;

  /// The color of the cursor when the [Rext] is selectable
  ///
  /// If not provided, the default cursor color
  /// will be null
  final Color? cursorColor;

  /// The height of the cursor when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default cursor
  /// height will be null
  final double? cursorHeight;

  /// The radius of the cursor when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default cursor
  /// radius will be null
  ///
  final Radius? cursorRadius;

  /// The width of the cursor when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default cursor
  /// width will be 2.0
  ///
  final double? cursorWidth;

  /// The drag start behavior of the text
  /// created by this widget when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default drag
  /// start behavior will be DragStartBehavior.start
  ///
  final DragStartBehavior? dragStartBehavior;

  /// The interactive selection of the text
  /// created by this widget when the [Rext]
  /// is selectable
  ///
  /// If not provided, the default interactive
  /// selection will be true
  ///
  final bool? enableInteractiveSelection;

  /// The focus node of the text created
  /// by this widget when the [Rext] is
  /// selectable
  ///
  /// If not provided, the default focus
  /// node will be null
  ///
  final FocusNode? focusNode;

  /// The magnifier configuration of the
  /// text created by this widget when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default magnifier
  /// configuration will be null
  ///
  final TextMagnifierConfiguration? magnifierConfiguration;

  /// The minimum number of lines of the
  /// text created by this widget when the
  /// [Rext] is selectable
  ///
  /// If not provided, the default minimum
  /// number of lines will be null
  ///
  final int? minLines;

  /// The selection changed of the text
  /// created by this widget when the [Rext]
  /// is selectable
  ///
  /// If not provided, the default selection
  /// changed will be null
  ///
  final void Function(TextSelection selection, SelectionChangedCause? cause)? onSelectionChanged;

  /// The tap of the text created by this
  /// widget when the [Rext] is selectable
  ///
  /// If not provided, the default tap will
  /// be null
  ///
  final GestureTapCallback? onTap;

  /// The scroll physics of the text created
  /// by this widget when the [Rext] is selectable
  ///
  /// If not provided, the default scroll
  /// physics will be null
  ///
  final ScrollPhysics? scrollPhysics;

  /// The selection controls of the text
  /// created by this widget when the [Rext]
  /// is selectable
  ///
  /// If not provided, the default selection
  /// controls will be null
  ///
  final TextSelectionControls? selectionControls;

  /// The selection height style of the text
  /// created by this widget when the [Rext]
  /// is selectable
  ///
  /// If not provided, the default selection
  /// height style will be BoxHeightStyle.tight
  ///
  final BoxHeightStyle? selectionHeightStyle;

  /// The selection width style of the text
  /// created by this widget when the [Rext]
  /// is selectable
  ///
  /// If not provided, the default selection
  /// width style will be BoxWidthStyle.tight
  ///
  final BoxWidthStyle? selectionWidthStyle;

  /// The show cursor of the text created
  /// by this widget when the [Rext] is selectable
  ///
  /// If not provided, the default show cursor
  /// will be false
  ///
  final bool? showCursor;

  ///The [Rext] widget created by this widget
  ///
  @override
  State<Rext> createState() => RextState();
}

///The state of the [Rext] widget
///
class RextState extends State<Rext> {
  ///The responsive font size of the text
  double? _responsiveFontSize;

  ///A bool to check if the text fits
  bool _fits = false;

  ///Initializes the state of the [Rext] widget
  ///and registers the widget to the [RextGroup]
  ///if it is provided.
  @override
  void initState() {
    ///Register the widget to the [RextGroup]
    ///if it is provided.
    if (widget.rextGroup != null) {
      widget.rextGroup!.registerText(this);
    }

    if (widget._isSelectable && widget.contextMenuBuilder != null && widget.useDefaultContextMenuOnWeb) {
      BrowserContextMenu.disableContextMenu();
    }

    ///Check for errors
    checkForErrors();
    super.initState();
  }

  ///Disposes the state of the [Rext] widget
  ///and removes the widget from the [RextGroup]
  @override
  void dispose() {
    if (widget.rextGroup != null) {
      widget.rextGroup!.remove(this);
    }

    if (widget._isSelectable && widget.contextMenuBuilder != null && widget.useDefaultContextMenuOnWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    super.dispose();
  }

  ///Builds the [Rext] widget
  @override
  Widget build(BuildContext context) {
    ///A [LayoutBuilder] widget that will
    ///calculate the constraints of the
    ///parent widget and calculate the
    ///responsive font size of the text
    ///based on the constraints.
    return LayoutBuilder(
      builder: (context, constraints) {
        ///Calculate the responsive font size
        ///of the text based on the constraints
        ///of the parent widget. If the [RextGroup]
        ///is provided, it will calculate the
        ///biggest font size that will fit all
        ///the [Rext] widgets in the group.
        ///Otherwise, it will calculate the
        ///font size based on the constraintsz
        _responsiveFontSize = widget.rextGroup != null ? widget.rextGroup!.updateGroupFontSize(this, _calculateFontSize(constraints)) : _calculateFontSize(constraints);

        ///Build the text widget with the
        ///responsive font size.
        ///If the [RextGroup] is provided,
        ///it will use the maximum number of
        ///lines of the group. Otherwise, it
        ///will use the maximum number of lines.
        return _buildText(
          ///The responsive font size of the text
          ///based on the constraints of the parent
          ///widget.
          ///
          ///Default value is 14
          _responsiveFontSize ?? 14,

          ///The style of the text
          ///
          ///Default value is [DefaultTextStyle]
          widget.style ?? DefaultTextStyle.of(context).style,

          ///The maximum number of lines of the text
          ///
          ///If the [RextGroup] is provided, it will
          ///use the maximum number of lines of the
          ///group. Otherwise, it will use the maximum
          ///number of lines.
          ///
          ///Default value is null (no limit)
          widget.rextGroup != null ? widget.rextGroup!.groupMaxLines : widget.maxLines,
        );
      },
    );
  }

  ///Builds the text widget with the
  ///responsive font size.
  ///
  ///If the [data] is provided, it will
  ///use the [data] to create the text
  ///widget. Otherwise, it will use the
  ///[InlineSpan] to create the text widget.
  Widget _buildText(double fontSize, TextStyle style, int? maxLines) {
    ///If the [data] is provided, it will
    ///use the [data] to create the text
    ///
    if (!_fits && widget.showDefaultOverflowWidget) return ResponsiveUtil.rextOverflowWidget!;

    if (widget.data != null) {
      ///Create the text widget with the
      ///[data] and the responsive font size
      ///
      ///
      ///If the text is selectable, it will
      ///use the [SelectableText] widget to
      ///create the text widget
      if (widget._isSelectable) {
        return SelectableText(
          widget.data!,
          key: widget.textKey,
          style: style.copyWith(fontSize: fontSize),
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          maxLines: maxLines,
          semanticsLabel: widget.semanticsLabel,
          textHeightBehavior: widget.textHeightBehavior,
          textScaler: widget.textScaler,
          textWidthBasis: widget.textWidthBasis,
          autofocus: widget.autofocus ?? false,
          contextMenuBuilder: widget.contextMenuBuilder,
          cursorColor: widget.cursorColor,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorWidth: widget.cursorWidth ?? 2.0,
          dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
          enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
          focusNode: widget.focusNode,
          magnifierConfiguration: widget.magnifierConfiguration,
          minLines: widget.minLines,
          onSelectionChanged: widget.onSelectionChanged,
          onTap: widget.onTap,
          scrollPhysics: widget.scrollPhysics,
          selectionControls: widget.selectionControls,
          selectionHeightStyle: widget.selectionHeightStyle ?? BoxHeightStyle.tight,
          selectionWidthStyle: widget.selectionWidthStyle ?? BoxWidthStyle.tight,
          showCursor: widget.showCursor ?? false,
        );
      }

      ///Otherwise, it will use the [Text]
      ///widget to create the text widget
      return Text(
        widget.data!,
        key: widget.textKey,
        style: style.copyWith(fontSize: fontSize),
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        locale: widget.locale,
        softWrap: widget.softWrap,
        overflow: widget.overflow,
        maxLines: maxLines,
        selectionColor: widget.selectionColor,
        semanticsLabel: widget.semanticsLabel,
        textHeightBehavior: widget.textHeightBehavior,
        textScaler: widget.textScaler,
        textWidthBasis: widget.textWidthBasis,
      );

      ///Otherwise, it will use the [TextSpan]
      ///to create the text widget
    } else {
      ///Create the text widget with the
      ///[TextSpan] and the responsive font size
      ///
      ///If the text is selectable, it will
      ///use the [SelectableText.rich] widget
      ///to create the text widget
      if (widget._isSelectable) {
        return SelectableText.rich(
          widget.textSpan!,
          key: widget.textKey,
          style: widget.style?.copyWith(fontSize: _responsiveFontSize) ?? TextStyle(fontSize: _responsiveFontSize),
          strutStyle: widget.strutStyle,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          maxLines: maxLines,
          semanticsLabel: widget.semanticsLabel,
          textHeightBehavior: widget.textHeightBehavior,
          textScaler: widget.textScaler,
          textWidthBasis: widget.textWidthBasis,
          autofocus: widget.autofocus ?? false,
          contextMenuBuilder: widget.contextMenuBuilder,
          cursorColor: widget.cursorColor,
          cursorHeight: widget.cursorHeight,
          cursorRadius: widget.cursorRadius,
          cursorWidth: widget.cursorWidth ?? 2.0,
          dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
          enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
          focusNode: widget.focusNode,
          magnifierConfiguration: widget.magnifierConfiguration,
          minLines: widget.minLines,
          onSelectionChanged: widget.onSelectionChanged,
          onTap: widget.onTap,
          scrollPhysics: widget.scrollPhysics,
          selectionControls: widget.selectionControls,
          selectionHeightStyle: widget.selectionHeightStyle ?? BoxHeightStyle.tight,
          selectionWidthStyle: widget.selectionWidthStyle ?? BoxWidthStyle.tight,
          showCursor: widget.showCursor ?? false,
        );
      }

      ///Otherwise, it will use the [Text.rich]
      ///widget to create the text widget
      return Text.rich(
        widget.textSpan!,
        key: widget.textKey,
        style: widget.style?.copyWith(fontSize: _responsiveFontSize) ?? TextStyle(fontSize: _responsiveFontSize),
        strutStyle: widget.strutStyle,
        textAlign: widget.textAlign,
        textDirection: widget.textDirection,
        locale: widget.locale,
        softWrap: widget.softWrap,
        overflow: widget.overflow,
        maxLines: maxLines,
        selectionColor: widget.selectionColor,
        semanticsLabel: widget.semanticsLabel,
        textHeightBehavior: widget.textHeightBehavior,
        textScaler: widget.textScaler,
        textWidthBasis: widget.textWidthBasis,
      );
    }
  }

  ///Calculates the responsive font size
  ///of the text based on the constraints
  ///of the parent widget.
  ///
  ///If the [presetFontSizes] is provided,
  ///it will use the list of preset font
  ///sizes to calculate the responsive font
  ///size. Otherwise, it will calculate the
  ///font size based on the constraints
  ///and adjust the font size based on the
  ///[adjustmentSize].
  double _calculateFontSize(BoxConstraints constraints) {
    ///The font size of the text
    ///
    ///If not provided, the default font
    ///size will be 14
    double fontSize = widget.rextGroup != null ? widget.rextGroup!.groupFontSize ?? 14 : widget.fontSize ?? 14;

    ///The maximum font size of the text
    ///
    ///If not provided, the default maximum
    ///font size will be double.infinity
    final double maxFontSize = widget.rextGroup != null ? widget.rextGroup!.groupMaxFontSize ?? double.infinity : widget.maxFontSize ?? double.infinity;

    ///The minimum font size of the text
    ///
    ///If not provided, the default minimum
    ///font size will be 8
    final double minFontSize = widget.rextGroup != null ? widget.rextGroup!.groupMinFontSize ?? 8 : widget.minFontSize ?? 8;

    ///The style of the text
    ///
    ///If not provided, the default style
    ///will be [DefaultTextStyle]
    final TextStyle style = (widget.style ?? DefaultTextStyle.of(context).style);

    ///If the [presetFontSizes] is provided and not empty
    ///it will sort the list of preset font sizes from
    ///biggest to smallest and calculate the responsive
    ///font size based on the constraints.
    ///
    ///It will return the first font size that fits the
    ///constraints.
    if (widget.presetFontSizes != null && widget.presetFontSizes!.isNotEmpty ||
        widget.rextGroup != null && widget.rextGroup!.groupPresetFontSizes != null && widget.rextGroup!.groupPresetFontSizes!.isNotEmpty) {
      ///Set the list of preset font sizes
      ///to a new list
      List<double> sortedFontSizes = widget.rextGroup != null ? List.from(widget.rextGroup!.groupPresetFontSizes!) : List.from(widget.presetFontSizes!);

      ///Sort the list of preset font sizes from
      ///biggest to smallest
      sortedFontSizes.sort((a, b) => b.compareTo(a));

      ///Calculate the responsive font size
      ///based on the list of preset font sizes
      ///and the constraints of the parent widget
      for (double presetFontSize in sortedFontSizes) {
        ///If the font size fits the constraints
        ///of the parent widget, it will return
        ///the font size and break the loop
        if (_fitsConstraints(presetFontSize, style, constraints)) {
          _fits = true;
          return presetFontSize;
        }
        _fits = false;
      }
    }

    ///If the [presetFontSizes] is not provided
    ///or empty, it will calculate the responsive
    ///font size based on the constraints of the
    ///parent widget and adjust the font size
    ///based on the [adjustmentSize].
    while (fontSize > minFontSize) {
      ///If the font size fits the constraints
      ///of the parent widget, it will return
      ///the font size. Otherwise, it will
      ///decrease the font size by the
      ///[adjustmentSize] and try again.
      if (_fitsConstraints(fontSize, style, constraints)) {
        break;
      } else {
        ///Decrease the font size by the
        ///[adjustmentSize]. If the
        ///[adjustmentSize] is not provided,
        ///the default adjustment size will
        ///be 0.5
        ///
        fontSize -= widget.adjustmentSize ?? 0.5;
      }
    }

    ///Return the font size of the text
    ///based on the constraints of the
    ///parent widget.
    ///
    if (fontSize > maxFontSize) {
      if (_fitsConstraints(fontSize, style, constraints)) {
        _fits = true;
      } else {
        _fits = false;
      }
      return maxFontSize;
    } else {
      if (_fitsConstraints(fontSize, style, constraints)) {
        _fits = true;
      } else {
        _fits = false;
      }
      return fontSize;
    }
  }

  ///Checks if the font size fits the
  ///constraints of the parent widget.
  bool _fitsConstraints(double fontSize, TextStyle style, BoxConstraints constraints) {
    ///Create a [TextPainter] widget with
    ///the text, style, and font size
    final TextPainter textPainter = TextPainter(
      text: widget.data != null ? TextSpan(text: widget.data, style: style.copyWith(fontSize: fontSize)) : TextSpan(style: style.copyWith(fontSize: fontSize), children: widget.textSpan!.children),
      textDirection: widget.textDirection ?? TextDirection.ltr,
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.rextGroup != null ? widget.rextGroup!.groupMaxLines : widget.maxLines,
      strutStyle: widget.strutStyle,
      textScaler: widget.textScaler ?? TextScaler.noScaling,
    );

    ///Layout the text painter with the
    ///constraints of the parent widget
    ///and check if the text fits the
    ///constraints of the parent widget.
    textPainter.layout(maxWidth: constraints.maxWidth);

    ///Return true if the text fits the
    ///constraints of the parent widget
    ///and it does not exceed the maximum
    ///number of lines. Otherwise, return
    ///false.
    return !(textPainter.didExceedMaxLines || textPainter.width > constraints.maxWidth);
  }

  ///Notifies the [RextGroup] that the
  ///font size of the [Rext] widget has
  ///been updated. It will rebuild the
  ///widget.
  void notifyTextChange() {
    setState(() {});
  }

  ///Checks for errors in the [Rext] widget
  ///and throws an error if there is an issue.
  void checkForErrors() {
    assert(widget.data != null || widget.textSpan != null, throw ResponsiveException('Rext widget must have either a text (string) or textSpan property'));
    if (widget.rextGroup != null) {
      assert(
        widget.fontSize == null,
        throw ResponsiveException('Font size in the Rext widget cannot be used when a RextGroup is provided. Use the groupFontSize property in the RextGroup instead'),
      );
      assert(
        widget.maxFontSize == null,
        throw ResponsiveException('Max font size in the Rext widget cannot be used when a RextGroup is provided. Use the groupMaxFontSize property in the RextGroup instead'),
      );
      assert(
        widget.minFontSize == null,
        throw ResponsiveException('Min font size in the Rext widget cannot be used when a RextGroup is provided. Use the groupMinFontSize property in the RextGroup instead'),
      );
      assert(
        widget.presetFontSizes == null,
        throw ResponsiveException('Preset font sizes in the Rext widget cannot be used when a RextGroup is provided. Use the groupPresetFontSizes property in the RextGroup instead'),
      );
      assert(
        widget.maxLines == null,
        throw ResponsiveException('Max lines in the Rext widget cannot be used when a RextGroup is provided. Use the groupMaxLines property in the RextGroup instead'),
      );
      assert(widget.adjustmentSize == null,
          throw ResponsiveException('Adjustment size in the Rext widget cannot be used when a RextGroup is provided. Use the groupAdjustmentSize property in the RextGroup instead'));
    }
  }
}
