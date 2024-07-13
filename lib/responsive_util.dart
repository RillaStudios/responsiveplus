part of 'responsive.dart';

enum DeviceType { android, ios, macos, windows, linux, fuchsia, web }

enum ScreenType { mobile, tablet, desktop }

class ResponsiveUtil {
  static late BoxConstraints boxConstraints;

  static late Orientation orientation;

  static late DeviceType deviceType;

  static late ScreenType screenType;

  static late List<DeviceType> supportedPlatforms;

  static late double width;

  static late double height;

  static bool allowOrientationChange = false;

  static void init({required bool enableOrientationChange, required List<DeviceType> devicePlatforms}) {
    allowOrientationChange = enableOrientationChange;

    if (!allowOrientationChange) {
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
    }

    if (devicePlatforms.isEmpty) {
      throw Exception('Please provide at least one platform');
    }

    supportedPlatforms = devicePlatforms;
  }

  static void updateScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;

    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }

    if (kIsWeb) {
      if (!supportedPlatforms.contains(DeviceType.web)) {
        throw Exception('Web platform is not supported');
      }
      deviceType = DeviceType.web;
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          if (!supportedPlatforms.contains(DeviceType.android)) {
            throw Exception('Android platform is not supported');
          }
          deviceType = DeviceType.android;
          break;
        case TargetPlatform.iOS:
          if (!supportedPlatforms.contains(DeviceType.ios)) {
            throw Exception('iOS platform is not supported');
          }
          deviceType = DeviceType.ios;
          break;
        case TargetPlatform.macOS:
          if (!supportedPlatforms.contains(DeviceType.macos)) {
            throw Exception('macOS platform is not supported');
          }
          deviceType = DeviceType.macos;
          break;
        case TargetPlatform.windows:
          if (!supportedPlatforms.contains(DeviceType.windows)) {
            throw Exception('Windows platform is not supported');
          }
          deviceType = DeviceType.windows;
          break;
        case TargetPlatform.linux:
          if (!supportedPlatforms.contains(DeviceType.linux)) {
            throw Exception('Linux platform is not supported');
          }
          deviceType = DeviceType.linux;
          break;
        case TargetPlatform.fuchsia:
          if (!supportedPlatforms.contains(DeviceType.fuchsia)) {
            throw Exception('Fuchsia platform is not supported');
          }
          deviceType = DeviceType.fuchsia;
          break;
        default:
      }
    }
  }
}
