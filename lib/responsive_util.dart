part of 'responsive.dart';

enum DeviceType { android, ios, macos, windows, linux, fuchsia, web }

enum ScreenType { mobile, tablet, desktop }

/* 
ResponseiveUtil class is a utility class that provides
methods to initialize the responsive package and update
the screen size and orientation when the screen size changes.

It also provides some static variables to store the screen size,
orientation, device type, and supported platforms.

The init method is called when the app is launched to initialize
the responsive package. The updateScreenSize method is called
when the screen size changes to update the screen size and orientation.

@author IFD
@since 2024/07/12
*/
class ResponsiveUtil {
  static late BoxConstraints boxConstraints;

  static late Orientation orientation;

  static late DeviceType deviceType;

  static late ScreenType screenType;

  static late List<DeviceType> supportedPlatforms;

  static late double width;

  static late double height;

  static bool allowOrientationChange = false;

  /* 
  A method to call when the app is launched 
  to initialize the responsive package

  @author IFD
  @since 2024/07/12
  */
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

  /* 
  A method to update the screen size and orientation
  when the screen size changes

  @author IFD
  @since 2024/07/12
  */
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
