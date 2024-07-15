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

    if (!allowOrientationChange && !kIsWeb) {
      SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
    }

    if (devicePlatforms.isEmpty) {
      throw Exception('Please provide at least one platform');
    }

    //Sets the screen type based on the screen width
    final double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    final double physicalWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width;
    width = physicalWidth / devicePixelRatio;

    final double physicalHeight = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.height;
    height = physicalHeight / devicePixelRatio;

    if (width >= 1024) {
      screenType = ScreenType.desktop;
    } else if (width >= 600) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.mobile;
    }

    //Sets the available platforms based on parameter input
    //and checks weather device is eligible for app.

    supportedPlatforms = devicePlatforms;

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

  /* 
  A method to update the screen size and orientation
  when the screen size changes

  @author IFD
  @since 2024/07/12
  */
  static void updateScreenSize(BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;

    orientation = currentOrientation;

    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    if (width >= 1024) {
      screenType = ScreenType.desktop;
    } else if (width >= 600) {
      screenType = ScreenType.tablet;
    } else {
      screenType = ScreenType.mobile;
    }
  }

  /* 
  A bool to check weather the device is mobile

  @author IFD
  @since 2024/07/15
  */
  bool isMobile() {
    return screenType == ScreenType.mobile;
  }

  /* 
  A bool weather the device is tablet

  @author IFD
  @since 2024/07/15
  */
  bool isTablet() {
    return screenType == ScreenType.tablet;
  }

  /* 
  A bool weather the device is desktop

  @author IFD
  @since 2024/07/15
  */
  bool isDesktop() {
    return screenType == ScreenType.desktop;
  }

  /* 
  A bool weather the device is iOS

  @author IFD
  @since 2024/07/15
  */
  bool isIos() {
    return deviceType == DeviceType.ios;
  }

  /* 
  A bool weather the device is Android

  @author IFD
  @since 2024/07/15
  */
  bool isAndroid() {
    return deviceType == DeviceType.android;
  }

  /* 
  A bool weather the device is macOS

  @author IFD
  @since 2024/07/15
  */
  bool isMacOs() {
    return deviceType == DeviceType.macos;
  }

  /* 
  A bool weather the device is Windows

  @author IFD
  @since 2024/07/15
  */
  bool isWindows() {
    return deviceType == DeviceType.windows;
  }

  /* 
  A bool weather the device is Linux

  @author IFD
  @since 2024/07/15
  */
  bool isLinux() {
    return deviceType == DeviceType.linux;
  }

  /* 
  A bool weather the device is Fuchsia

  @author IFD
  @since 2024/07/15
  */
  bool isFuchsia() {
    return deviceType == DeviceType.fuchsia;
  }

  /* 
  A bool weather the device is Web

  @author IFD
  @since 2024/07/15
  */
  bool isWeb() {
    return deviceType == DeviceType.web;
  }

  /* 
  A method to get the current device type

  @author IFD
  @since 2024/07/15
  */
  DeviceType getDeviceType() {
    return deviceType;
  }

  /* 
  A method to get the current screen type

  @author IFD
  @since 2024/07/15
  */
  ScreenType getScreenType() {
    return screenType;
  }

  /* 
  A method to get the supported platforms

  @author IFD
  @since 2024/07/15
  */
  List<DeviceType> getSupportedPlatforms() {
    return supportedPlatforms;
  }

  /* 
  A method to get the current orientation

  @author IFD
  @since 2024/07/15
  */
  Orientation getOrientation() {
    return orientation;
  }

  /* 
  A method to get the current box constraints

  @author IFD
  @since 2024/07/15
  */
  BoxConstraints getBoxConstraints() {
    return boxConstraints;
  }

  /* 
  A method to get the current screen width

  @author IFD
  @since 2024/07/15
  */
  double getWidth() {
    return width;
  }

  /* 
  A method to get the current screen height

  @author IFD
  @since 2024/07/15
  */
  double getHeight() {
    return height;
  }

  /* 
  A method to return a double based on the screen type

  @author IFD
  @since 2024/07/15
  */
  double getDouble({required double mobile, double? tablet, required double desktop}) {
    if (isMobile()) {
      return mobile;
    } else if (isTablet()) {
      return tablet ?? mobile;
    } else {
      return desktop;
    }
  }

  /* 
  A method to return a int based on the screen type

  @author IFD
  @since 2024/07/15
  */
  int getInt({required int mobile, int? tablet, required int desktop}) {
    if (isMobile()) {
      return mobile;
    } else if (isTablet()) {
      return tablet ?? mobile;
    } else {
      return desktop;
    }
  }
}
