part of 'package:responsive/responsive.dart';

class RextGroup {
  RextGroup({
    this.groupFontSize,
    this.groupMaxFontSize,
    this.groupMinFontSize,
    this.groupMaxLines,
    this.groupAdjustmentSize,
  });

  final double? groupFontSize;

  final double? groupMaxFontSize;

  final double? groupMinFontSize;

  final double? groupAdjustmentSize;

  final int? groupMaxLines;

  final List<double>? groupPresetFontSizes = [];

  final Map<RextState, double> rextListeners = {};

  bool rextsNotified = false;

  void registerText(RextState rext) {
    rextListeners[rext] = double.infinity;
  }

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
