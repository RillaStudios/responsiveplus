part of 'package:responsive/responsive.dart';

/// A group of [RextState] widgets that share the same font size.
/// This class is used to manage the font size of the [RextState] widgets.
/// It is used to ensure that all [RextState] widgets in the group have the same font size.
class RextGroup {
  /// Creates a new [RextGroup] with the given parameters.
  /// The [groupFontSize] parameter is the font size of the group.
  /// The [groupMaxFontSize] parameter is the maximum font size of the group.
  /// The [groupMinFontSize] parameter is the minimum font size of the group.
  /// The [groupMaxLines] parameter is the maximum number of lines of the group.
  /// The [groupAdjustmentSize] parameter is the adjustment size of the group.
  /// The [groupPresetFontSizes] parameter is the font sizes of the group presets.
  RextGroup({
    this.groupFontSize,
    this.groupMaxFontSize,
    this.groupMinFontSize,
    this.groupMaxLines,
    this.groupAdjustmentSize,
  });

  /// The font size of the group.
  /// This is the font size that will be applied to all [RextState] widgets in the group.
  /// If this is null, the font size of the [RextState] widgets will be determined by the [RextState] widget itself.
  final double? groupFontSize;

  /// The maximum font size of the group.
  /// This is the maximum font size that will be applied to all [RextState] widgets in the group.
  /// If this is null, the maximum font size of the [RextState] widgets will be determined by the [RextState] widget itself.
  final double? groupMaxFontSize;

  /// The minimum font size of the group.
  /// This is the minimum font size that will be applied to all [RextState] widgets in the group.
  /// If this is null, the minimum font size of the [RextState] widgets will be determined by the [RextState] widget itself.
  final double? groupMinFontSize;

  /// The adjustment size of the group.
  /// This is the adjustment size that will be applied to all [RextState] widgets in the group.
  /// If this is null, the adjustment size of the [RextState] widgets will be determined by the [RextState] widget itself.
  final double? groupAdjustmentSize;

  /// The maximum number of lines of the group.
  /// This is the maximum number of lines that will be applied to all [RextState] widgets in the group.
  /// If this is null, the maximum number of lines of the [RextState] widgets will be determined by the [RextState] widget itself.
  final int? groupMaxLines;

  /// The font sizes of the group presets.
  /// This is the font sizes that will be applied to all [RextState] widgets in the group.
  /// If this is null, the font sizes of the [RextState] widgets will be determined by the [RextState] widget itself.
  final List<double>? groupPresetFontSizes = [];

  /// The [RextState] widgets in the group.
  /// This is a list of [RextState] widgets that are in the group.
  /// The font size of the [RextState] widgets will be determined by the [RextState] widget itself.
  final Map<RextState, double> rextListeners = {};

  /// Registers a [RextState] widget in the group.
  /// This method is used to register a [RextState] widget in the group.
  void registerText(RextState rext) {
    rextListeners[rext] = double.infinity;
  }

  /// Updates the font size of the [RextState] widgets in the group.
  /// This method is used to update the font size of the [RextState] widgets in the group.
  double updateGroupFontSize(RextState rext, double newFontSize) {
    rextListeners[rext] = newFontSize;

    for (var size in rextListeners.values) {
      if (size < newFontSize) {
        newFontSize = size;
      }
    }

    return newFontSize;
  }
}
